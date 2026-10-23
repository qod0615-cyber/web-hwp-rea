"""Native tab/ribbon/popup geometry and pixels, plus separately counted command behavior."""
import hashlib
import json
import unittest
from io import BytesIO
from pathlib import Path
from PIL import Image, ImageChops
from playwright.sync_api import sync_playwright

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'verification/native-baseline/2026-10-22/ui-reference-manifest.json'
NATIVE=json.loads(SOURCE.read_text())
OUT=ROOT/'verification/ribbon-tabs'
LABELS=['보기','쪽','보안','검토','도구']


def menu_reference(label):
    return next(menu for menu in NATIVE['menus'] if menu['menu']==label)


def ribbon_controls(label):
    return [node for node in menu_reference(label)['ribbon_controls']
            if node.get('coordinates',{}).get('client') and node['coordinates']['client'][1]>=70
            and node['coordinates']['client'][3]<=148 and node['control_type']!='Custom']


class RibbonTabs(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        OUT.mkdir(parents=True,exist_ok=True)
        cls.runtime=sync_playwright().start(); cls.browser=cls.runtime.chromium.launch()

    @classmethod
    def tearDownClass(cls):
        cls.browser.close(); cls.runtime.stop()

    def setUp(self):
        self.page=self.browser.new_page(viewport={'width':1916,'height':918})
        self.page.set_default_timeout(5000)
        self.errors=[]; self.messages=[]
        self.page.on('pageerror',lambda error:self.errors.append(str(error)))
        def dialog_opened(dialog):
            self.messages.append(dialog.message); dialog.accept()
        self.page.on('dialog',dialog_opened)
        self.page.goto((ROOT/'index.html').as_uri())
        self.editor=self.page.locator('div[contenteditable="true"]').first
        self.editor.wait_for()

    def tearDown(self):
        self.page.close(); self.assertEqual(self.errors,[])

    def tab(self,label):
        self.page.get_by_title(label,exact=True).click()
        self.page.mouse.move(0,0)

    def click_control(self,label,name):
        node=next(n for n in ribbon_controls(label) if n['name'].split(' : ')[0]==name)
        left,top,right,bottom=node['coordinates']['client']
        self.page.mouse.click((left+right)/2-1,(top+bottom)/2-1)

    def test_five_ribbon_pixel_regions_and_91_control_rectangles(self):
        evidence=[]
        for label in LABELS:
            self.tab(label)
            self.assertEqual(self.page.locator('[data-native-control^="편집:"]').count(),0)
            self.assertEqual(self.page.get_by_title(label,exact=True).get_attribute('aria-pressed'),'true')
            capture=next(c for c in NATIVE['captures'] if c['name']==menu_reference(label)['label_capture'])
            source=SOURCE.parent/capture['raw']
            expected=Image.open(source).convert('RGB').crop((1,67,1254,151))
            actual=Image.open(BytesIO(self.page.screenshot(clip={'x':0,'y':66,'width':1253,'height':84}))).convert('RGB')
            actual.save(OUT/f'{menu_reference(label)["english_key"]}-ribbon.png')
            self.assertIsNone(ImageChops.difference(actual,expected).getbbox(),label)
            native_menu=Image.open(source).convert('RGB').crop((1,33,601,67))
            actual_menu=Image.open(BytesIO(self.page.screenshot(clip={'x':0,'y':32,'width':600,'height':34}))).convert('RGB')
            self.assertIsNone(ImageChops.difference(actual_menu,native_menu).getbbox(),label+' menu strip')
            checked=0
            for node in ribbon_controls(label):
                name=node['name'].split(' : ')[0]; marker=label+':'+name
                element=self.page.locator(f'[data-native-control="{marker}"]')
                self.assertEqual(element.count(),1,marker)
                l,t,r,b=node['coordinates']['client']; rect=element.bounding_box()
                self.assertEqual([rect[k] for k in ['x','y','width','height']],[l-1,t-1,r-l,b-t],marker)
                self.assertEqual(element.is_enabled(),node['enabled'],marker)
                for x,y in [(l+1,t+1),((l+r)/2-1,(t+b)/2-1),(r-3,b-3)]:
                    hit=self.page.evaluate('([x,y])=>document.elementFromPoint(x,y)?.closest("[data-native-control]")?.dataset.nativeControl',[x,y])
                    self.assertEqual(hit,marker,marker)
                checked+=1
            commands=self.page.locator(f'[data-native-control^="{label}:"]').evaluate_all('nodes=>nodes.map(e=>({name:e.title,status:e.dataset.commandStatus}))')
            evidence.append({'tab':label,'native_control_rectangles':checked,'different_pixels':0,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'commands':commands})
        (OUT/'pixel-and-geometry.json').write_text(json.dumps(evidence,ensure_ascii=False,indent=2)+'\n')

    def test_view_commands_change_document_view(self):
        self.tab('보기')
        zoom=self.page.get_by_role('spinbutton',name='화면 배율',exact=True)
        self.click_control('보기','100%'); self.assertEqual(zoom.input_value(),'100')
        self.click_control('보기','확대'); self.assertEqual(zoom.input_value(),'110')
        self.click_control('보기','축소'); self.assertEqual(zoom.input_value(),'100')
        self.click_control('보기','폭 맞춤'); width_zoom=int(zoom.input_value()); self.assertGreater(width_zoom,100)
        self.click_control('보기','쪽 맞춤'); self.assertLess(int(zoom.input_value()),width_zoom)
        paper=self.page.get_by_test_id('document-paper')
        self.click_control('보기','회색조'); self.assertEqual(paper.evaluate('e=>getComputedStyle(e).filter'),'grayscale(1)')
        self.click_control('보기','컬러'); self.assertEqual(paper.evaluate('e=>getComputedStyle(e).filter'),'none')
        self.editor.evaluate('e=>{e.innerHTML=\'<p>보존할 본문<img alt="그림" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aS1cAAAAASUVORK5CYII="></p>\'}')
        before=self.editor.inner_html()
        self.click_control('보기','그림'); self.assertEqual(self.editor.locator('img').evaluate('e=>getComputedStyle(e).visibility'),'hidden')
        self.click_control('보기','그림'); self.assertEqual(self.editor.locator('img').evaluate('e=>getComputedStyle(e).visibility'),'visible')
        self.assertEqual(self.editor.inner_html(),before)
        for name,testid in [('상황 선','document-status'),('문서 탭','document-tabs')]:
            self.click_control('보기',name); self.assertFalse(self.page.get_by_test_id(testid).is_visible())
            self.click_control('보기',name); self.assertTrue(self.page.get_by_test_id(testid).is_visible())
        self.assertEqual(self.messages,[])

    def test_page_commands_open_real_settings_and_change_orientation(self):
        self.tab('쪽'); paper=self.page.get_by_test_id('document-paper')
        portrait=paper.bounding_box()['width']
        self.click_control('쪽','가로'); self.assertGreater(paper.bounding_box()['width'],portrait)
        self.click_control('쪽','세로'); self.assertEqual(paper.bounding_box()['width'],portrait)
        self.click_control('쪽','편집 용지')
        self.assertTrue(self.page.get_by_role('dialog',name='편집 용지',exact=True).is_visible())
        self.page.keyboard.press('Escape')
        self.assertEqual(self.messages,[])

    def test_three_popup_pixels_keyboard_navigation_and_outside_close(self):
        for label in ['보안','검토','도구']:
            self.page.get_by_title(label+' 메뉴 펼치기',exact=True).click(); self.page.mouse.move(0,0)
            popup=self.page.get_by_role('menu',name=label+' 명령 메뉴',exact=True)
            self.assertTrue(popup.is_visible())
            rect=popup.bounding_box()
            capture=next(c for c in NATIVE['captures'] if c['name']==menu_reference(label)['arrow_capture'])
            source=Image.open(SOURCE.parent/capture['raw']).convert('RGB')
            l,t,w,h=[int(rect[k]) for k in ['x','y','width','height']]
            expected=source.crop((l+1,t+1,l+w+1,t+h+1))
            actual=Image.open(BytesIO(popup.screenshot())).convert('RGB')
            self.assertIsNone(ImageChops.difference(actual,expected).getbbox(),label)
            actual.save(OUT/f'{menu_reference(label)["english_key"]}-dropdown.png')
            self.assertEqual(self.page.get_by_title('편집',exact=True).get_attribute('aria-pressed'),'true')
            self.page.keyboard.press('ArrowDown')
            self.assertEqual(self.page.evaluate('document.activeElement.getAttribute("role")'),'menuitem')
            self.page.keyboard.press('Escape'); self.assertEqual(popup.count(),0)
            self.page.get_by_title(label+' 메뉴 펼치기',exact=True).click()
            self.page.mouse.click(1350,300); self.assertEqual(popup.count(),0)

    def test_unsupported_commands_do_not_claim_success_or_edit_document(self):
        self.editor.fill('그대로 보존'); before=self.editor.inner_html()
        self.tab('보안'); self.click_control('보안','문서 암호 설정')
        self.assertEqual(self.messages,['문서 암호 설정 기능은 아직 지원하지 않습니다.'])
        self.assertEqual(self.editor.inner_html(),before)
        self.assertEqual(self.page.locator('[data-native-control="보안:문서 암호 설정"]').get_attribute('data-command-status'),'unavailable')
        self.tab('쪽'); self.click_control('쪽','단')
        self.assertEqual(self.editor.evaluate('e=>getComputedStyle(e).columnCount'),'1')
        self.assertEqual(self.messages[-1],'단 기능은 아직 지원하지 않습니다.')


if __name__=='__main__':
    unittest.main(verbosity=2)

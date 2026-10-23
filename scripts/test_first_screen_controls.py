"""First-screen control coverage against independently collected native UIA rectangles."""
import json
import unittest
from io import BytesIO
from pathlib import Path
from PIL import Image, ImageChops
from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'verification/first-screen-controls'
SOURCE = ROOT / 'verification/native-baseline/2026-10-22/ui-reference-manifest.json'


def native_controls():
    source = json.loads(SOURCE.read_text())
    edit = source['menus'][0]
    result = []
    for menu in source['menus']:
        left,top,right,bottom = menu['menu_item_uia_bounds']['client']
        result.append(('메뉴',menu['menu'],[left-1,top-1,right-left,bottom-top]))
    file_menu = next(node for node in edit['dropdown_controls'] if node['name']=='파일 F')
    left,top,right,bottom = file_menu['coordinates']['client']
    result.append(('메뉴','파일',[left-1,top-1,right-left,bottom-top]))
    for group, nodes, y in [('편집', edit['ribbon_controls'], 71), ('빠른 서식', edit['dropdown_controls'], 157)]:
        for node in nodes:
            rect = node.get('coordinates', {}).get('client')
            if not rect or rect[1] != y or node['control_type'] == 'Custom':
                continue
            name = node['name'].split(' : ')[0]
            for prefix in ['글자 크기', '줄 간격']:
                if name.startswith(prefix):
                    name = prefix
            result.append((group, name, [rect[0]-1, rect[1]-1, rect[2]-rect[0], rect[3]-rect[1]]))
    return result


class FirstScreenControls(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        OUT.mkdir(parents=True, exist_ok=True)
        cls.runtime = sync_playwright().start()
        cls.browser = cls.runtime.chromium.launch()

    @classmethod
    def tearDownClass(cls):
        cls.browser.close()
        cls.runtime.stop()

    def setUp(self):
        self.page = self.browser.new_page(viewport={'width':1916,'height':918})
        self.page.set_default_timeout(5000)
        self.errors = []
        self.page.on('pageerror', lambda error: self.errors.append(str(error)))
        self.page.goto((ROOT / 'index.html').as_uri())
        self.editor = self.page.locator('div[contenteditable="true"]').first
        self.editor.wait_for()

    def tearDown(self):
        self.page.close()
        self.assertEqual(self.errors, [])

    def click_native(self, group, name):
        _, _, (x,y,w,h) = next(row for row in native_controls() if row[:2] == (group,name))
        self.page.mouse.click(x+w/2,y+h/2)

    def test_native_rectangles_and_edges_at_four_window_sizes(self):
        evidence = []
        for width,height in [(960,662),(1204,662),(1916,918),(2560,1440)]:
            self.page.set_viewport_size({'width':width,'height':height})
            checked = 0
            for group,name,(x,y,w,h) in native_controls():
                marker = group+':'+name
                element = self.page.locator(f'[data-native-control="{marker}"]')
                self.assertEqual(element.count(),1,marker)
                rect = element.bounding_box()
                self.assertEqual([rect[k] for k in ['x','y','width','height']],[x,y,w,h],marker)
                if x+w > width:
                    continue
                for dx,dy in [(2,2),(w/2,h/2),(w-2,h-2)]:
                    actual = self.page.evaluate('([x,y])=>document.elementFromPoint(x,y)?.closest("[data-native-control]")?.dataset.nativeControl',[x+dx,y+dy])
                    self.assertEqual(actual,marker,(width,marker,dx,dy,actual))
                checked += 1
            evidence.append({'viewport':[width,height],'visible_native_rectangles_checked':checked})
        (OUT/'native-hit-regions.json').write_text(json.dumps({'source':str(SOURCE),'checks':evidence,'scope':'Geometry and hit ownership only; not a native color or behavior equivalence claim.'},ensure_ascii=False,indent=2)+'\n')

    def test_print_hover_is_confined_to_native_bounds_and_click_prints(self):
        self.page.evaluate('()=>{window.print=()=>{window.printCalls=(window.printCalls||0)+1}}')
        self.page.mouse.move(1400,190)
        clip={'x':145,'y':150,'width':75,'height':36}
        before=Image.open(BytesIO(self.page.screenshot(clip=clip))).convert('RGB')
        self.page.mouse.move(170,168)
        after=Image.open(BytesIO(self.page.screenshot(clip=clip))).convert('RGB')
        self.assertEqual(ImageChops.difference(before,after).getbbox(),(13,6,37,30))
        after.save(OUT/'print-hover.png')
        self.click_native('빠른 서식','인쇄')
        self.assertEqual(self.page.evaluate('window.printCalls'),1)
        self.click_native('빠른 서식','미리 보기')
        self.assertEqual(self.page.evaluate('window.printCalls'),2)

    def test_coordinate_clicks_change_text_format_alignment_and_spacing(self):
        self.editor.fill('첫 화면 버튼 검사')
        self.editor.press('Control+a')
        self.click_native('빠른 서식','취소선')
        self.assertIn('line-through', self.editor.locator('strike,s,span').first.evaluate('e=>getComputedStyle(e).textDecorationLine'))
        for name,align in [('가운데 정렬','center'),('오른쪽 정렬','right'),('왼쪽 정렬','left'),('양쪽 정렬','justify'),('배분 정렬','justify'),('나눔 정렬','justify')]:
            self.click_native('빠른 서식',name)
            self.assertEqual(self.editor.evaluate('e=>getComputedStyle(e.firstElementChild||e).textAlign'),align,name)
        self.page.get_by_title('글자 크기',exact=True).select_option('24')
        self.assertEqual(self.editor.locator('font').last.evaluate('e=>getComputedStyle(e).fontSize'),'32px')
        spacing=self.page.get_by_role('spinbutton',name='빠른 서식 줄 간격',exact=True)
        spacing.fill('200'); spacing.press('Enter')
        self.assertEqual(self.editor.inner_text(),'첫 화면 버튼 검사')
        self.assertEqual(self.editor.locator('font').last.evaluate('e=>getComputedStyle(e).lineHeight'), '64px')
        self.page.get_by_title('글꼴',exact=True).select_option('궁서')
        self.assertIn('궁서',self.editor.inner_html())
        self.page.screenshot(path=str(OUT/'formatting-after-clicks.png'))

    def test_ribbon_coordinate_clicks_open_dialogs_and_replace(self):
        for name,title in [('글자 모양','글자 모양'),('문단 모양','문단 모양'),('쪽 여백','편집 용지')]:
            self.click_native('편집',name)
            self.assertTrue(self.page.get_by_role('dialog',name=title,exact=True).is_visible())
            self.page.keyboard.press('Escape')
        self.click_native('편집','글자 바꾸기')
        self.assertTrue(self.page.get_by_text('찾기 / 찾아 바꾸기 (Ctrl+F)',exact=True).is_visible())


if __name__=='__main__':
    unittest.main(verbosity=2)

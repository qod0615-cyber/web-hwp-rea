"""Real browser downloads + independent ZIP/XML assertions; no native HWP reopen claim."""
import json
import unittest
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED
from io import BytesIO
from xml.etree import ElementTree as ET
from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'verification/hwpx-roundtrip/browser-workflows'
NATIVE = ROOT / 'verification/hwpx-roundtrip/2026-10-23/native-job0058-reference.hwpx'
NS = {'p': 'http://www.hancom.co.kr/hwpml/2011/paragraph', 'h': 'http://www.hancom.co.kr/hwpml/2011/head'}


def parts(data):
    with ZipFile(BytesIO(data)) as z:
        assert z.infolist()[0].filename == 'mimetype'
        assert z.infolist()[0].compress_type == 0
        assert z.read('mimetype') == b'application/hwp+zip'
        return {name: z.read(name) for name in z.namelist()}


class HwpxWorkflows(unittest.TestCase):
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
        self.page = self.browser.new_page(viewport={'width': 1916, 'height': 918}, accept_downloads=True)
        self.page.set_default_timeout(5000)
        self.page.add_init_script("window.showOpenFilePicker=undefined;window.showSaveFilePicker=undefined;")
        self.errors = []
        self.page.on('pageerror', lambda error: self.errors.append(str(error)))
        self.page.on('dialog', lambda dialog: dialog.accept())
        self.page.goto((ROOT / 'index.html').as_uri())
        self.editor = self.page.locator('div[contenteditable="true"]').first
        self.editor.wait_for()
        self.editor.click()

    def tearDown(self):
        self.page.close()
        self.assertEqual(self.errors, [])

    def save(self, name):
        with self.page.expect_download() as info:
            self.page.keyboard.press('Control+s')
        target = OUT / name
        info.value.save_as(target)
        return target.read_bytes()

    def open(self, file, success=True):
        with self.page.expect_file_chooser() as info:
            self.page.keyboard.press('Control+o')
        info.value.set_files(str(file))
        if success:
            self.page.get_by_text('HWPX 문서 열기 완료', exact=False).wait_for()

    def test_new_rich_text_equation_table_roundtrip(self):
        self.editor.fill('시작')
        self.editor.evaluate('''e => {e.innerHTML='<div style="text-align:center;line-height:2"><b style="color:rgb(180, 20, 40);font-size:18pt">굵은 &lt;한글&gt;</b><i> italic</i><u><s> 장식</s></u><br>둘째\\t줄</div><table><tbody><tr><td>가</td><td>나</td></tr><tr><td>다</td><td>라</td></tr></tbody></table><div>끝</div>';e.dispatchEvent(new InputEvent('input',{bubbles:true}));}''')
        self.editor.press('Control+End')
        self.page.keyboard.press('Control+n'); self.page.keyboard.press('m')
        self.page.locator('textarea').fill('{a+b} over {c}')
        self.page.get_by_role('button', name='본문에 넣기 (Shift+ESC)', exact=True).click()
        data = self.save('new-rich-equation-table.hwpx')
        archive = parts(data)
        xml = ET.fromstring(archive['Contents/section0.xml']); header = ET.fromstring(archive['Contents/header.xml'])
        text = ''.join(xml.itertext())
        self.assertIn('굵은 <한글>', text); self.assertIn('둘째', text)
        self.assertEqual(xml.find('.//p:equation/p:script', NS).text, '{a+b} over {c}')
        self.assertEqual(len(xml.findall('.//p:tbl/p:tr', NS)), 2)
        self.assertEqual(len(xml.findall('.//p:tc', NS)), 4)
        bold = [c for c in header.findall('.//h:charPr', NS) if c.find('h:bold', NS) is not None and c.get('height') == '1800']
        self.assertTrue(bold); self.assertEqual(bold[0].get('textColor'), '#b41428')
        self.assertTrue(any(c.find('h:italic', NS) is not None for c in header.findall('.//h:charPr', NS)))
        self.assertTrue(any(c.find('h:underline', NS).get('type') == 'BOTTOM' and c.find('h:strikeout', NS).get('shape') == 'SOLID' for c in header.findall('.//h:charPr', NS)))
        self.assertIsNotNone(xml.find('.//p:lineBreak', NS)); self.assertIsNotNone(xml.find('.//p:tab', NS))
        self.open(OUT / 'new-rich-equation-table.hwpx')
        self.page.wait_for_function('document.querySelectorAll("[data-hwp-equation]").length===1')
        self.assertEqual(self.editor.locator('td').count(), 4)
        self.assertIn('굵은 <한글>', self.editor.inner_text())
        self.assertEqual(self.editor.locator('[data-hwp-equation]').get_attribute('data-hwp-equation'), '{a+b} over {c}')
        self.assertEqual(self.editor.locator('span').filter(has_text='굵은 <한글>').first.evaluate('e=>getComputedStyle(e).fontSize'), '24px')
        self.page.reload()
        self.assertEqual(self.editor.locator('td').count(), 4)
        reloaded = parts(self.save('after-reload.hwpx'))
        self.assertEqual(len(ET.fromstring(reloaded['Contents/section0.xml']).findall('.//p:tc', NS)), 4)
        self.page.screenshot(path=str(OUT / 'rich-document.png'))

    def test_native_314_equations_preserved_through_edit_and_reload(self):
        self.open(NATIVE)
        self.editor.locator('[data-hwp-equation]').last.wait_for()
        self.assertEqual(self.editor.locator('[data-hwp-equation]').count(), 314)
        self.page.reload()
        self.assertEqual(self.editor.locator('[data-hwp-equation]').count(), 314)
        first_para = self.editor.locator('[data-hwpx-paragraph]').first
        first_para.locator('[data-hwpx-char-ref]').first.evaluate('e=>e.appendChild(document.createTextNode(" 수정"))')
        saved = parts(self.save('native-314-edited.hwpx'))
        original = parts(NATIVE.read_bytes())
        before = ET.fromstring(original['Contents/section0.xml']); after = ET.fromstring(saved['Contents/section0.xml'])
        native_equations = before.findall('.//p:equation', NS); web_equations = after.findall('.//p:equation', NS)
        self.assertEqual(len(web_equations), 314)
        for expected, actual in zip(native_equations, web_equations):
            self.assertEqual(ET.tostring(expected), ET.tostring(actual))
        self.assertIn(' 수정', ''.join(after.itertext()))
        for name in original:
            if name not in ['Contents/header.xml','Contents/section0.xml','Contents/content.hpf','Preview/PrvText.txt','Preview/PrvImage.png']:
                self.assertEqual(saved[name], original[name], name)

    def test_invalid_open_preserves_document_and_title(self):
        self.editor.fill('보존할 본문'); title = self.page.title()
        bad = OUT / 'invalid.hwpx'; bad.write_text('not a ZIP')
        self.open(bad, success=False)
        self.page.get_by_text('HWPX 형식의 파일을 선택해 주세요.', exact=False).wait_for()
        self.assertEqual(self.editor.inner_text(), '보존할 본문'); self.assertEqual(self.page.title(), title)

    def test_merged_table_text_edit_preserves_cell_geometry(self):
        # Synthetic fixture: exercises XML preservation without claiming a native reopen.
        self.editor.evaluate('''e=>{
            e.innerHTML='<table><tbody><tr><td rowspan="2">병합</td><td>위</td></tr><tr><td>아래</td></tr></tbody></table>';
            e.dispatchEvent(new InputEvent('input',{bubbles:true}));
        }''')
        archive = parts(self.save('merged-table-seed.hwpx'))
        xml = ET.fromstring(archive['Contents/section0.xml'])
        cells = xml.findall('.//p:tc', NS)
        for index, cell in enumerate(cells):
            cell.find('p:cellSz', NS).set('width', str(10000 + index * 500))
            cell.find('p:cellSz', NS).set('height', str(3100 + index * 200))
            cell.find('p:cellMargin', NS).set('left', str(170 + index * 30))
        geometry = [[ET.tostring(cell.find('p:'+tag, NS)) for tag in ['cellAddr','cellSpan','cellSz','cellMargin']] for cell in cells]
        self.assertEqual(cells[-1].find('p:cellAddr', NS).get('colAddr'), '1')
        archive['Contents/section0.xml'] = ET.tostring(xml)
        fixture = OUT / 'synthetic-merged-table.hwpx'
        with ZipFile(fixture, 'w', compression=ZIP_DEFLATED) as z:
            for name, data in archive.items():
                z.writestr(name, data, compress_type=0 if name=='mimetype' else ZIP_DEFLATED)
        self.open(fixture)
        self.editor.locator('td').first.locator('[data-hwpx-char-ref]').first.evaluate('e=>e.appendChild(document.createTextNode(" 수정"))')
        saved = parts(self.save('merged-table-edited.hwpx'))
        after = ET.fromstring(saved['Contents/section0.xml'])
        self.assertIn('병합 수정', ''.join(after.itertext()))
        self.assertEqual(after.find('.//p:tbl', NS).get('colCnt'), '2')
        self.assertEqual([[ET.tostring(cell.find('p:'+tag, NS)) for tag in ['cellAddr','cellSpan','cellSz','cellMargin']] for cell in after.findall('.//p:tc', NS)], geometry)

    def test_picker_cancel_write_failure_save_and_save_as(self):
        self.editor.fill('파일 연결 시험')
        self.page.evaluate('''() => {
            window.picks=0; window.writes=[]; window.mode='cancel';
            window.showSaveFilePicker=async()=>{
                window.picks++;
                if(window.mode==='cancel') throw new DOMException('cancel','AbortError');
                const name='문서'+window.picks+'.hwpx';
                return {name, createWritable:async()=>({
                    write:async bytes=>{
                        if(window.mode==='fail') throw Error('쓰기 실패');
                        window.writes.push(Array.from(bytes));
                    }, close:async()=>{}, abort:async()=>{}
                })};
            };
        }''')
        title = self.page.title(); self.page.keyboard.press('Control+s')
        self.page.wait_for_function('window.picks===1'); self.assertEqual(self.page.title(), title)
        self.page.evaluate("window.mode='fail'"); self.page.keyboard.press('Control+s')
        self.page.get_by_text('쓰기 실패', exact=False).wait_for(); self.assertEqual(self.page.title(), title)
        self.page.evaluate("window.mode='ok'"); self.page.keyboard.press('Control+s')
        self.page.wait_for_function('document.title.includes("문서3.hwpx")')
        self.page.keyboard.press('Control+s'); self.page.wait_for_function('window.writes.length===2')
        self.assertEqual(self.page.evaluate('window.picks'), 3)
        self.page.keyboard.press('Control+Shift+s'); self.page.wait_for_function('window.picks===4 && window.writes.length===3')
        self.assertIn('문서4.hwpx', self.page.title())
        parts(bytes(self.page.evaluate('window.writes[2]')))

    def test_unsupported_new_object_blocks_save_without_content_loss(self):
        self.editor.evaluate('e=>e.innerHTML=\'<div>본문<img src="data:image/png;base64," alt="그림"></div>\'')
        before = self.editor.inner_html()
        self.page.keyboard.press('Control+s')
        self.page.get_by_text('이 개체의 HWPX 저장은 아직 지원하지 않습니다. 문서 내용은 유지됩니다.', exact=False).wait_for()
        self.assertEqual(self.editor.inner_html(), before)

    def test_multiple_sections_and_opaque_native_object_preserved(self):
        original = parts(NATIVE.read_bytes())
        pns = NS['p']; opf = 'http://www.idpf.org/2007/opf/'
        section = ET.fromstring(original['Contents/section0.xml']); p = list(section)[0]
        for child in list(section)[1:]: section.remove(child)
        run = p.find('p:run', NS); ET.SubElement(run, '{'+pns+'}bookmark', {'name':'opaque-keep'})
        original['Contents/section0.xml'] = ET.tostring(section)
        original['Contents/section1.xml'] = ET.tostring(section)
        package = ET.fromstring(original['Contents/content.hpf'])
        ET.SubElement(package.find('{'+opf+'}manifest'), '{'+opf+'}item', {'id':'section1','href':'Contents/section1.xml','media-type':'application/xml'})
        ET.SubElement(package.find('{'+opf+'}spine'), '{'+opf+'}itemref', {'idref':'section1','linear':'yes'})
        original['Contents/content.hpf'] = ET.tostring(package)
        header = ET.fromstring(original['Contents/header.xml']); header.set('secCnt','2'); original['Contents/header.xml']=ET.tostring(header)
        original['BinData/unchanged.bin']=b'opaque attachment\x00\x01'
        file = OUT / 'synthetic-multisection.hwpx'
        with ZipFile(file,'w',compression=ZIP_DEFLATED) as z:
            for name, data in original.items(): z.writestr(name,data,compress_type=0 if name=='mimetype' else ZIP_DEFLATED)
        self.open(file); self.page.wait_for_function('document.querySelectorAll("[data-hwpx-section]").length===2')
        self.editor.locator('[data-hwpx-paragraph]').first.evaluate('e=>e.appendChild(document.createTextNode("추가"))')
        saved = parts(self.save('multisection-edited.hwpx'))
        self.assertEqual(saved['BinData/unchanged.bin'], original['BinData/unchanged.bin'])
        for name in ['Contents/section0.xml','Contents/section1.xml']:
            self.assertIsNotNone(ET.fromstring(saved[name]).find('.//p:bookmark', NS))
        self.assertEqual(ET.tostring(ET.fromstring(saved['Contents/section1.xml'])), ET.tostring(ET.fromstring(original['Contents/section1.xml'])))


if __name__ == '__main__':
    unittest.main(verbosity=2)

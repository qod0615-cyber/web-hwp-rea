"""Browser regression checks. Run after npm run build.

Requires Python Playwright and Chromium (also used by the existing comparison tools).
"""
import unittest
import json
from io import BytesIO
from pathlib import Path
from PIL import Image, ImageChops
from xml.etree import ElementTree as ET
from zipfile import ZipFile
from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]


class EditorWorkflows(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.runtime = sync_playwright().start()
        cls.browser = cls.runtime.chromium.launch()

    @classmethod
    def tearDownClass(cls):
        cls.browser.close()
        cls.runtime.stop()

    def setUp(self):
        self.page = self.browser.new_page(viewport={'width': 1916, 'height': 918})
        self.page.set_default_timeout(5000)
        self.errors = []
        self.page.on('pageerror', lambda error: self.errors.append(str(error)))
        self.page.goto((ROOT / 'index.html').as_uri())
        self.editor = self.page.locator('div[contenteditable="true"]').first

    def tearDown(self):
        self.page.close()
        self.assertEqual(self.errors, [])

    def open_equation(self):
        self.page.keyboard.press('Control+n')
        self.page.keyboard.press('m')
        self.page.locator('textarea').wait_for()

    def test_equation_insert_edit_undo_and_reload(self):
        self.editor.fill('앞뒤')
        self.editor.press('ArrowLeft')
        self.open_equation()
        script = '{a+b} over {c}'
        self.page.locator('textarea').fill(script)
        self.page.get_by_role('button', name='본문에 넣기 (Shift+ESC)', exact=True).click()
        equation = self.editor.locator('[data-hwp-equation]')
        self.assertEqual(equation.count(), 1)
        self.assertEqual(equation.get_attribute('data-hwp-equation'), script)
        self.assertEqual(self.editor.evaluate('(e)=>e.firstChild.textContent'), '앞')
        self.assertEqual(self.editor.evaluate('(e)=>e.lastChild.textContent'), '뒤')
        self.assertEqual(equation.locator('svg').count(), 1)
        line = equation.locator('line')
        self.assertGreater(float(line.get_attribute('x2')) - float(line.get_attribute('x1')), 20)
        self.page.keyboard.press('Control+z')
        self.assertEqual(equation.count(), 0)
        self.page.keyboard.press('Control+y')
        self.assertEqual(equation.count(), 1)
        equation.dblclick()
        self.assertEqual(self.page.locator('textarea').input_value(), script)
        self.page.locator('textarea').fill('sqrt {x^2+y^2}')
        self.page.keyboard.press('Shift+Escape')
        self.assertEqual(equation.count(), 1)
        self.assertEqual(equation.get_attribute('data-hwp-equation'), 'sqrt {x^2+y^2}')

        self.page.reload()
        self.assertEqual(equation.count(), 1)
        self.assertEqual(equation.get_attribute('data-hwp-equation'), 'sqrt {x^2+y^2}')
        equation.dblclick()
        self.page.locator('textarea').fill('cancelled')
        self.page.keyboard.press('Escape')
        self.assertTrue(self.page.get_by_role('alertdialog', name='수식 넣기 확인').is_visible())
        self.page.get_by_role('button', name='나가기(N)', exact=True).click()
        self.assertEqual(equation.get_attribute('data-hwp-equation'), 'sqrt {x^2+y^2}')

    def test_native_complex_equations_render_symbols_and_dimensions(self):
        fixture = ROOT / 'verification/hwpx-roundtrip/2026-10-22/existing-native-generated-job-0043.hwpx'
        namespace = {'p': 'http://www.hancom.co.kr/hwpml/2011/paragraph'}
        with ZipFile(fixture) as archive:
            root = ET.fromstring(archive.read('Contents/section0.xml'))
        samples = []
        for equation in root.findall('.//p:equation', namespace):
            script = equation.findtext('p:script', '', namespace)
            for prefix, symbols in [('int ', [0xe05b]), ('lim ', [ord('l'), ord('i'), ord('m')]),
                                    ('e = {cases', [0xe04b]), ('h~LEFT |', [0xe101]), ('matrix{', [ord('P')])]:
                if script.startswith(prefix):
                    samples.append((script, equation.find('p:sz', namespace), symbols))
        self.assertEqual(len(samples), 5)
        self.open_equation()
        svg = self.page.locator('.equation-rendered svg')
        for script, size, symbols in samples:
            with self.subTest(script=script):
                self.page.locator('textarea').fill(script)
                self.assertAlmostEqual(float(svg.get_attribute('width')), int(size.get('width')) / 75 * 2, places=4)
                self.assertAlmostEqual(float(svg.get_attribute('height')), int(size.get('height')) / 75 * 2, places=4)
                codes = {ord(char) for text in svg.locator('text').all_text_contents() for char in text}
                self.assertTrue(set(symbols).issubset(codes), f'missing native symbol: {symbols}')
                if script.startswith('int '):
                    out = ROOT / 'verification/equation-corpus/2026-10-23'
                    out.mkdir(parents=True, exist_ok=True)
                    self.page.get_by_role('dialog', name='수식 편집기', exact=True).screenshot(path=str(out / 'editor-integral.png'))
        self.page.locator('textarea').fill('sum _{k=1} ^{n} x')
        self.assertIn(chr(0xe067), ''.join(svg.locator('text').all_text_contents()))

    def test_table_and_character_dialog_restore_selection(self):
        self.editor.fill('앞뒤')
        self.editor.press('ArrowLeft')
        self.page.keyboard.press('Control+n')
        self.page.keyboard.press('t')
        self.page.get_by_role('spinbutton', name='표 줄 개수', exact=True).fill('2')
        self.page.get_by_role('spinbutton', name='표 칸 개수', exact=True).fill('3')
        self.page.get_by_title('만들기 (Enter)', exact=True).click()
        self.assertEqual(self.editor.locator('table tr').count(), 2)
        self.assertEqual(self.editor.locator('table td').count(), 6)
        self.page.reload()
        self.assertEqual(self.editor.locator('table td').count(), 6)
        self.editor.fill('앞뒤')
        self.editor.press('ArrowLeft')
        self.page.keyboard.press('Control+F10')
        self.page.get_by_role('button', name='넣기(Enter)', exact=True).click()
        self.assertEqual(self.editor.inner_text(), '앞※뒤')

    def test_font_dialog_applies_to_body_selection(self):
        self.editor.fill('본문')
        self.editor.press('Control+a')
        self.page.keyboard.press('Alt+l')
        self.page.locator('input[type="number"]').first.fill('24')
        self.page.get_by_role('button', name='설정(Enter)', exact=True).click()
        self.assertIn('font-size:', self.editor.inner_html())
        self.assertEqual(self.editor.inner_text(), '본문')
        self.page.reload()
        self.assertIn('font-size:', self.editor.inner_html())

    def test_offline_font_and_equation_source_are_safe(self):
        self.assertTrue(self.page.evaluate("async()=>{await document.fonts.load('16px HYhwpEQ');return document.fonts.check('16px HYhwpEQ')}"))
        self.editor.fill('문서')
        self.open_equation()
        script = '<img src=x onerror=alert(1)>'
        self.page.locator('textarea').fill(script)
        self.page.get_by_role('button', name='본문에 넣기 (Shift+ESC)', exact=True).click()
        self.assertEqual(self.editor.locator('img').count(), 0)
        self.assertEqual(self.editor.locator('[data-hwp-equation]').get_attribute('data-hwp-equation'), script)

    def test_toolbar_hitboxes_and_viewport_fit(self):
        ribbon = [(33, '오려두기'), (79, '복사하기'), (130, '붙이기'), (172, '모양 복사'),
                  (220, '조판'), (282, '글자 모양'), (320, '문단 모양'), (360, '스타일'),
                  (415, '세로'), (453, '가로'), (505, '쪽 여백'), (549, '바탕쪽'),
                  (590, '단'), (641, '도형'), (679, '그림'), (717, '표'), (755, '차트'),
                  (819, '개체 선택'), (873, '개체 보호'), (932, '찾기')]
        menus = [(30, '파일'), (96, '편집'), (163, '보기'), (222, '입력'), (281, '서식'),
                 (334, '쪽'), (388, '보안'), (447, '검토'), (506, '도구')]
        formatting = [(28, '새 문서'), (70, '불러오기'), (112, '저장하기'), (169, '인쇄'),
                      (195, '미리'), (236, '되돌리기'), (278, '다시'), (795, '진하게'),
                      (821, '기울임'), (847, '밑줄'), (380, '스타일'), (590, '글꼴'), (710, '글자 크기')]
        for width, height in [(960, 662), (1204, 662), (1916, 918), (2560, 1440)]:
            with self.subTest(width=width):
                self.page.set_viewport_size({'width': width, 'height': height})
                self.assertEqual(self.page.evaluate('document.documentElement.scrollWidth'), width)
                for entries, y in [(ribbon, 96), (menus, 48), (formatting, 169)]:
                    for x, title in entries:
                        found = self.page.evaluate('([x,y])=>document.elementFromPoint(x,y)?.title', [x, y])
                        self.assertIn(title, found or '', (width, x, y, title, found))
                box = self.page.get_by_title('최대화', exact=True).bounding_box()
                self.assertLessEqual(box['x'] + box['width'], width)
                editor_box = self.editor.bounding_box()
                self.assertGreaterEqual(editor_box['x'], 0)
                self.assertLessEqual(editor_box['x'] + editor_box['width'], width)
                self.assertEqual(self.page.locator('#root > div').evaluate('(e)=>e.getBoundingClientRect().height'), height)

    def test_equation_visual_slots_navigation_and_native_close_confirmation(self):
        self.open_equation()
        dialog = self.page.get_by_role('dialog', name='수식 편집기', exact=True)
        self.assertEqual((dialog.bounding_box()['width'], dialog.bounding_box()['height']), (950, 400))
        visual = self.page.get_by_role('textbox', name='수식 시각 편집', exact=True)
        command = self.page.get_by_role('textbox', name='수식 명령어', exact=True)
        self.assertEqual(command.input_value(), '')
        self.assertEqual(self.page.get_by_label('수식 글자 크기', exact=True).input_value(), '11')
        self.assertEqual(self.page.get_by_label('수식 편집 배율', exact=True).input_value(), '200')
        visual.fill('a+b')
        self.page.get_by_role('button', name='분수', exact=True).click()
        visual.press('1')
        visual.press('ArrowDown')
        visual.press('2')
        self.assertEqual(command.input_value(), 'a+b {1} over {2}')
        visual.press('Control+z')
        self.assertEqual(command.input_value(), 'a+b {1} over { }')
        visual.press('Control+y')
        self.assertEqual(command.input_value(), 'a+b {1} over {2}')
        split = self.page.get_by_role('separator', name='수식 명령 영역 분리선', exact=True)
        before = command.bounding_box()['y']
        split.press('ArrowDown')
        self.assertEqual(command.bounding_box()['y'], before + 5)
        visual.press('Escape')
        confirmation = self.page.get_by_role('alertdialog', name='수식 넣기 확인', exact=True)
        self.assertTrue(confirmation.is_visible())
        self.page.get_by_role('button', name='취소(C)', exact=True).click()
        self.assertEqual(confirmation.count(), 0)
        self.assertTrue(dialog.is_visible())
        visual.press('Shift+Escape')
        equation = self.editor.locator('[data-hwp-equation]')
        self.assertEqual(equation.get_attribute('data-hwp-equation'), 'a+b {1} over {2}')
        self.assertEqual(equation.get_attribute('data-hwp-equation-size'), '11')
        equation.dblclick()
        self.assertEqual(command.input_value(), 'a+b {1} over {2}')
        visual.press('Escape')
        self.assertEqual(dialog.count(), 0)

    def test_equation_templates_match_native_copied_scripts(self):
        contract = json.loads((ROOT / 'verification/equation-behavior-contract.json').read_text(encoding='utf-8'))
        self.open_equation()
        visual = self.page.get_by_role('textbox', name='수식 시각 편집', exact=True)
        command = self.page.get_by_role('textbox', name='수식 명령어', exact=True)
        visual.fill('a+b')
        self.assertEqual(command.input_value(), contract['scripts']['a+b'])
        visual.fill('')
        self.page.get_by_role('button', name='분수', exact=True).click()
        self.assertEqual(command.input_value(), contract['scripts']['empty_fraction'])
        visual.press('1')
        visual.press('ArrowDown')
        visual.press('2')
        self.assertEqual(command.input_value(), contract['scripts']['filled_1_over_2'])
        visual.press('Escape')
        self.page.keyboard.press('Escape')
        self.assertEqual(self.page.get_by_role('alertdialog').count(), 0)
        self.assertTrue(self.page.get_by_role('dialog', name='수식 편집기', exact=True).is_visible())
        visual.press('Escape')
        self.page.get_by_role('button', name='나가기(N)', exact=True).click()
        self.assertEqual(self.editor.locator('[data-hwp-equation]').count(), 0)

    def test_native_menu_labels_switch_ribbon_and_arrows_open_menu(self):
        native_dir = ROOT / 'verification/native-baseline/2026-10-22'
        for label, image_name, action in [
            ('입력', 'ui-reference-ribbon-input.raw.png', '수식 (Ctrl+N, M)'),
            ('서식', 'ui-reference-ribbon-format-verified.raw.png', '글자 모양 (Alt+L)')
        ]:
            self.page.get_by_title(label, exact=True).click()
            self.page.mouse.move(0, 0)
            self.assertEqual(self.page.get_by_role('button', name=label, exact=True).get_attribute('aria-pressed'), 'true')
            self.assertEqual(self.page.get_by_title(action, exact=True).count(), 1)
            # Fixed tool region only: independent native PNG, excluding window borders.
            box = {'x': 1, 'y': 66, 'width': 1253, 'height': 84}
            actual = Image.open(BytesIO(self.page.screenshot(clip=box))).convert('RGB')
            expected = Image.open(native_dir / image_name).convert('RGB').crop((1, 66, 1254, 150))
            self.assertIsNone(ImageChops.difference(actual, expected).getbbox())
        self.page.get_by_title('입력 메뉴 펼치기', exact=True).click()
        self.assertTrue(self.page.get_by_text('수식...', exact=True).is_visible())
        self.page.keyboard.press('Escape')
        self.page.get_by_title('입력', exact=True).click()
        self.page.get_by_title('수식 (Ctrl+N, M)', exact=True).click()
        self.assertTrue(self.page.locator('textarea').is_visible())

    def test_native_dialog_dimensions_apply_and_cancel(self):
        native_dir = ROOT / 'verification/native-baseline/2026-10-22'
        for shortcut, name, fixture in [
            ('Alt+l', '글자 모양', 'ui-reference-dialog-font-recovered.dialog.png'),
            ('Alt+t', '문단 모양', 'ui-reference-dialog-paragraph-rendered.dialog.png'),
            ('F7', '편집 용지', 'ui-reference-dialog-page-rendered.dialog.png')
        ]:
            self.page.keyboard.press(shortcut)
            dialog = self.page.get_by_role('dialog', name=name, exact=True)
            rect = dialog.bounding_box()
            with Image.open(native_dir / fixture) as reference:
                self.assertEqual((rect['width'], rect['height']), reference.size)
            self.page.keyboard.press('Escape')
            self.assertEqual(dialog.count(), 0)
        self.editor.fill('문단')
        self.page.keyboard.press('Alt+t')
        self.page.get_by_role('spinbutton', name='줄 간격', exact=True).fill('200')
        self.page.get_by_role('button', name='설정(Enter)', exact=True).click()
        self.assertIn('line-height: 2;', self.editor.inner_html())
        self.page.reload()
        self.assertIn('line-height: 2;', self.editor.inner_html())
        before = self.editor.bounding_box()
        self.page.keyboard.press('F7')
        self.page.get_by_role('spinbutton', name='왼쪽', exact=True).fill('40')
        self.page.get_by_role('button', name='취소(ESC)', exact=True).click()
        self.assertEqual(self.editor.bounding_box()['x'], before['x'])
        self.page.keyboard.press('F7')
        self.assertEqual(self.page.get_by_role('spinbutton', name='왼쪽', exact=True).input_value(), '30')
        self.page.get_by_role('spinbutton', name='왼쪽', exact=True).fill('40')
        self.page.get_by_role('button', name='설정(Enter)', exact=True).click()
        self.assertAlmostEqual(self.editor.bounding_box()['x'] - before['x'], 10 * 96 / 25.4 * float(self.page.get_by_role('spinbutton', name='화면 배율', exact=True).input_value()) / 100, delta=.1)

    def test_portrait_button_pixels_match_native_states(self):
        native_dir = ROOT / 'verification/native-baseline/2026-10-22'
        button = self.page.get_by_title('용지 방향: 세로', exact=True)
        self.assertEqual(button.evaluate('(e)=>getComputedStyle(e).cursor'), 'default')
        # Native captures are independent Windows HWP observations, not images
        # rendered from this implementation. Compare only the measured control.
        for state in ['normal', 'hover', 'pressed', 'released']:
            with self.subTest(state=state):
                if state == 'normal':
                    self.page.mouse.move(0, 0)
                elif state == 'hover':
                    button.hover()
                elif state == 'pressed':
                    self.page.mouse.down()
                else:
                    self.page.mouse.up()
                image = Image.open(BytesIO(self.page.screenshot(clip={'x': 397, 'y': 70, 'width': 38, 'height': 76}))).convert('RGB')
                native = Image.open(native_dir / f'retry2-ribbon-{state}.raw.png').convert('RGB').crop((398, 71, 436, 147))
                self.assertIsNone(ImageChops.difference(image, native).getbbox())


if __name__ == '__main__':
    unittest.main(verbosity=2)

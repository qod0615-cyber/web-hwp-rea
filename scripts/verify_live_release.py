"""Read-only production verification in a disposable browser context; never deploys."""
from pathlib import Path
from io import BytesIO
from zipfile import ZipFile
from xml.etree import ElementTree as ET
import hashlib,json
from playwright.sync_api import sync_playwright

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'verification/release-2026-10-23'
URL='https://web-hwp-rea.vercel.app/'
record=json.loads((OUT/'release.json').read_text())
expected=record['local_release']['build']
report={'url':URL,'expected_build':expected,'deployment_id':record['deployment']['id'],'browser_errors':[]}
with sync_playwright() as runtime:
    browser=runtime.chromium.launch()
    context=browser.new_context(viewport={'width':1916,'height':918},accept_downloads=True)
    page=context.new_page();page.set_default_timeout(15000)
    page.add_init_script('window.showSaveFilePicker=undefined;window.showOpenFilePicker=undefined;')
    page.on('pageerror',lambda error:report['browser_errors'].append(str(error)))
    response=page.goto(URL,wait_until='networkidle')
    assert response.status==200,response.status
    report['http_status']=response.status
    actual=page.locator('meta[name="web-hwp-build"]').get_attribute('content')
    assert actual==expected,(expected,actual)
    report['build']=actual
    release=context.request.get(URL+'release.json')
    assert release.ok and release.json()['build']==actual
    worker=context.request.get(URL+'sw.js')
    assert worker.ok and actual in worker.text()
    report['cache_headers']={name:r.headers.get('cache-control') for name,r in [('release.json',release),('sw.js',worker)]}
    assert all('no-store' in value for value in report['cache_headers'].values())
    report['tab_control_counts']={}
    for label,count in [('보기',24),('쪽',22),('보안',10),('검토',16),('도구',19)]:
        page.get_by_title(label,exact=True).click()
        actual_count=page.locator(f'[data-native-control^="{label}:"]').count()
        assert actual_count==count,(label,actual_count)
        assert page.locator('[data-native-control^="편집:"]').count()==0
        report['tab_control_counts'][label]=count
    page.get_by_title('보안 메뉴 펼치기',exact=True).click()
    assert page.get_by_role('menu',name='보안 명령 메뉴',exact=True).is_visible()
    page.keyboard.press('Escape')
    assert page.get_by_role('menu',name='보안 명령 메뉴',exact=True).count()==0
    page.get_by_title('보기',exact=True).click()
    page.get_by_title('100%',exact=True).click()
    assert page.get_by_role('spinbutton',name='화면 배율',exact=True).input_value()=='100'
    page.get_by_title('편집',exact=True).click()
    page.mouse.move(0,0)
    page.screenshot(path=str(OUT/'live-first-screen.png'))
    editor=page.locator('div[contenteditable="true"]').first
    editor.fill('배포 검증 본문')
    editor.press('End');page.keyboard.press('Control+n');page.keyboard.press('m')
    page.locator('textarea').fill('{a+b} over {c}')
    page.get_by_role('button',name='본문에 넣기 (Shift+ESC)',exact=True).click()
    assert editor.locator('[data-hwp-equation]').count()==1
    with page.expect_download() as download:
        page.keyboard.press('Control+s')
    document=OUT/'live-saved.hwpx';download.value.save_as(document)
    data=document.read_bytes()
    with ZipFile(BytesIO(data)) as archive:
        assert archive.infolist()[0].filename=='mimetype'
        assert archive.infolist()[0].compress_type==0
        assert archive.read('mimetype')==b'application/hwp+zip'
        xml=ET.fromstring(archive.read('Contents/section0.xml'))
        ns={'p':'http://www.hancom.co.kr/hwpml/2011/paragraph'}
        assert xml.find('.//p:equation/p:script',ns).text=='{a+b} over {c}'
        assert '배포 검증 본문' in ''.join(xml.itertext())
    report['hwpx_download']={'valid_zip_xml':True,'equation_script':'{a+b} over {c}','sha256':hashlib.sha256(data).hexdigest()}
    with page.expect_file_chooser() as chooser:
        page.keyboard.press('Control+o')
    chooser.value.set_files(str(document))
    page.get_by_text('HWPX 문서 열기 완료',exact=False).wait_for()
    assert editor.locator('[data-hwp-equation]').count()==1
    assert '배포 검증 본문' in editor.inner_text()
    report['hwpx_reopened_in_browser']=True
    page.evaluate('async()=>await navigator.serviceWorker.ready')
    page.wait_for_function('navigator.serviceWorker.controller!==null')
    report['service_worker_controlled']=True
    context.set_offline(True)
    page.reload(wait_until='load')
    assert page.locator('meta[name="web-hwp-build"]').get_attribute('content')==expected
    assert '배포 검증 본문' in editor.inner_text()
    assert editor.locator('[data-hwp-equation]').count()==1
    page.get_by_title('쪽',exact=True).click()
    assert page.locator('[data-native-control^="쪽:"]').count()==22
    page.mouse.move(0,0);page.screenshot(path=str(OUT/'live-offline-page-tab.png'))
    report['offline_document_equation_and_tabs_restored']=True
    assert not report['browser_errors'],report['browser_errors']
    browser.close()
(OUT/'live-check.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(report,ensure_ascii=False,indent=2))

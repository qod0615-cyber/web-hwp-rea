"""Extract reviewed native ribbon references and their actual UIA control rectangles."""
import hashlib
import json
from pathlib import Path
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'verification/native-baseline/2026-10-22/ui-reference-manifest.json'
source = json.loads(SOURCE.read_text())
tabs = {}
for label, slug in [('보기','view'),('쪽','page'),('보안','security'),('검토','review'),('도구','tools')]:
    menu = next(m for m in source['menus'] if m['menu']==label)
    capture = next(c for c in source['captures'] if c['name']==menu['label_capture'])
    if capture['review_status'] != 'verified_visual_reference':
        raise ValueError('Unreviewed native capture: '+label)
    path = SOURCE.parent / capture['raw']
    image = Image.open(path).convert('RGB')
    # Use the same native-client minus (1,1) mapping as UIA control bounds.
    ribbon = Image.new('RGB',(1916,84),'white')
    ribbon.paste(image.crop((1,67,1326,151)),(0,0))
    ribbon_path = ROOT / f'public/hwp_native_{slug}_ribbon.png'
    ribbon.save(ribbon_path)
    menu_image = Image.open(ROOT / 'public/hwp_native_menu.png').convert('RGB')
    menu_image.paste(image.crop((1,33,601,67)),(0,0))
    menu_path = ROOT / f'public/hwp_native_{slug}_menu.png'
    menu_image.save(menu_path)
    controls = []
    for node in menu['ribbon_controls']:
        rect = node.get('coordinates',{}).get('client')
        if not rect or rect[1]<70 or rect[3]>148 or node['control_type']=='Custom':
            continue
        left,top,right,bottom = rect
        controls.append({'name':node['name'].split(' : ')[0], 'type':node['control_type'], 'enabled':node['enabled'],
                         'x':left-1,'y':top-1,'w':right-left,'h':bottom-top})
    tabs[label] = {'ribbonAsset':'/'+ribbon_path.name,'menuAsset':'/'+menu_path.name,
                   'capture':str(path.relative_to(ROOT)),'captureSha256':hashlib.sha256(path.read_bytes()).hexdigest(),'controls':controls}
    if label in ['보안','검토','도구']:
        popup_capture = next(c for c in source['captures'] if c['name']==menu['arrow_capture'])
        if popup_capture['review_status'] != 'verified_visual_reference':
            raise ValueError('Unreviewed native popup: '+label)
        popup_source = SOURCE.parent / popup_capture['raw']
        popup_items = {}
        item_left = menu['menu_item_uia_bounds']['client'][0] + 3
        for node in menu['dropdown_controls']:
            rect = node.get('coordinates',{}).get('client')
            if not rect or node['control_type']!='MenuItem' or rect[0]!=item_left or rect[1]<70 or rect[2]-rect[0]<150:
                continue
            name = node['name'].split(' : ')[0]
            left,top,right,bottom = rect
            popup_items[name]={'name':name,'enabled':node['enabled'],'x':left-1,'y':top-1,'w':right-left,'h':bottom-top}
        items = list(popup_items.values())
        left = min(item['x'] for item in items)-3
        top = min(item['y'] for item in items)-3
        right = max(item['x']+item['w'] for item in items)+3
        bottom = max(item['y']+item['h'] for item in items)+3
        popup_path = ROOT / f'public/hwp_native_{slug}_dropdown.png'
        Image.open(popup_source).convert('RGB').crop((left+1,top+1,right+1,bottom+1)).save(popup_path)
        tabs[label]['dropdown']={'asset':'/'+popup_path.name,'x':left,'y':top,'w':right-left,'h':bottom-top,'items':items,
                                  'capture':str(popup_source.relative_to(ROOT)),'captureSha256':hashlib.sha256(popup_source.read_bytes()).hexdigest()}
report = {'source':str(SOURCE.relative_to(ROOT)),'sourceSha256':hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
          'ribbonCrop':[1,67,1326,151],'menuCrop':[1,33,601,67],'tabs':tabs}
(ROOT / 'src/components/ribbon-reference.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print({label:len(tab['controls']) for label,tab in tabs.items()})

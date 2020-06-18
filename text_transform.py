import re
import lxml.html
import lxml

def fix_html(text, remove_wrapper=False):
    """Fix invalid html, remove unnecessary attribs, tags and whitespace"""
    text = text.strip()
    text = text.replace('\r', '') # remove \r as lxml escapes it
    doc = lxml.html.document_fromstring(text)

    anchors = doc.body.findall('.//a')
    for anchor in anchors:
        anchor.attrib.pop('id', None)
        anchor.attrib.pop('name', None)

    children = []
    for elem in doc.body:
        if not elem.text:
            continue
        children.append(lxml.etree.tostring(elem, encoding='unicode'))
    text = '\n'.join(children)
    if remove_wrapper:
        text = re.sub(r'^<p>', '', text)
        text = re.sub(r'</p>$', '', text)
    text = re.sub(r'</?c_q\d+>', '', text) # remove <c_q10> like tags
    return text

def standardize_terms(text):
    terms = [
        'PBUH',
        'P.B.U.H.',
        'peace_be_upon_him',
        '(may peace be upon him)',
        '(saws)',
        '(SAW)',
        '(saw)'
    ]
    for term in terms:
        text = text.replace(term, '(\ufdfa)')

    text = text.replace('he Apostle of Allah', 'he Messenger of Allah')
    text = text.replace('he Apostle of Allaah', 'he Messenger of Allah')
    text = text.replace('Allah\'s Apostle', 'Allah\'s Messenger')
    text = text.replace('he Holy Prophet ', 'he Prophet ')

    text = re.sub(r'Allah\'s Messenger (?!\()', 'Allah\'s Messenger (\ufdfa) ', text)
    text = re.sub(r'he Messenger of Allah (?!\()', 'he Messenger of Allah (\ufdfa) ', text)
    text = re.sub(r'he Prophet (?!\()', 'he Prophet (\ufdfa) ', text)

    return text

def fix_hyperlinks(text):
    """Converts links to ayah and hadith to quran.com and sunnah.com respectively"""
    text = text.replace('href="/', 'href="https://sunnah.com/')

    quran_links = re.findall(r'javascript:openquran\((.+?)\)', text)
    for link_match in quran_links:
        surah, begin, end = link_match.split(',')
        text = text.replace(
            'javascript:openquran({})'.format(link_match),
            'https://quran.com/{}/{}-{}'.format(int(surah)+1, begin, end)
        )
    return text

def cleanup_text(text):
    if not text:
        return text
    text = re.sub(r'\n+', '\n', text)
    text = re.sub(r' +', ' ', text)
    text = fix_html(text)
    text = fix_hyperlinks(text)
    text = text.strip()
    return text

def cleanup_en_text(text):
    if not text:
        return text
    text = cleanup_text(text)
    text = standardize_terms(text)
    return text

def cleanup_chapter_title(text):
    if not text:
        return text
    text = re.sub(r'\n+', '\n', text)
    text = re.sub(r' +', ' ', text)
    text = fix_html(text, remove_wrapper=True)
    text = fix_hyperlinks(text)
    text = text.strip()
    return text

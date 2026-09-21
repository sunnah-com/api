import unittest

from text_transform import cleanup_text, cleanup_en_text, cleanup_chapter_title, cleanup_en_chapter_title


class TestCleanupWhitespaceOnlyText(unittest.TestCase):
    """Regression test for sunnah-com/api#158 / #403.

    Bukhari chapters 89 & 96 returned a 500 because some hadith/chapter
    text fields contain a non-empty, whitespace-only string (e.g. a
    single space). `fix_html` stripped it down to an empty string and
    passed it to `lxml.html.document_fromstring`, which raises
    `lxml.etree.ParserError: Document is empty` for empty input.
    """

    def test_cleanup_text_whitespace_only(self):
        for value in (" ", "\n", "\n \n", "   \n  "):
            self.assertEqual(cleanup_text(value), "")

    def test_cleanup_en_text_whitespace_only(self):
        for value in (" ", "\n", "\n \n"):
            self.assertEqual(cleanup_en_text(value), "")

    def test_cleanup_chapter_title_whitespace_only(self):
        for value in (" ", "\n"):
            self.assertEqual(cleanup_chapter_title(value), "")

    def test_cleanup_en_chapter_title_whitespace_only(self):
        for value in (" ", "\n"):
            self.assertEqual(cleanup_en_chapter_title(value), "")

    def test_cleanup_text_none_and_empty_unaffected(self):
        self.assertIsNone(cleanup_text(None))
        self.assertEqual(cleanup_text(""), "")

    def test_cleanup_text_normal_html_still_works(self):
        self.assertEqual(cleanup_text("<p>Hello</p>"), "<p>Hello</p>")


if __name__ == "__main__":
    unittest.main()

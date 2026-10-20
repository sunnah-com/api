import unittest

from hadith_number import matches_hadith_number


class TestMatchesHadithNumber(unittest.TestCase):
    """Regression test for sunnah-com/api#614.

    Some hadiths are stored under a combined number such as "6924, 6925",
    so looking up either number on its own must still find that hadith.
    """

    def test_comma_separated_parts(self):
        for number in ("6924", "6925"):
            self.assertTrue(matches_hadith_number("6924, 6925", number))
        self.assertTrue(matches_hadith_number("6924,6925,6926", "6926"))

    def test_dash_separated_parts(self):
        for number in ("6924", "6925"):
            self.assertTrue(matches_hadith_number("6924 - 6925", number))

    def test_exact_number(self):
        self.assertTrue(matches_hadith_number("6924", "6924"))

    def test_substring_is_not_a_match(self):
        for number in ("692", "924", "69246", ""):
            self.assertFalse(matches_hadith_number("6924, 6925", number))
        self.assertFalse(matches_hadith_number("16924", "6924"))

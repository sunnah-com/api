def matches_hadith_number(stored, number):
    """Check if `number` is one part of a combined number like "6924, 6925" or "6924-6925"."""
    return any(part.strip() == number for separator in (",", "-") for part in stored.split(separator))

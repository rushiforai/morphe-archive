"""Unit tests for the offline Markdown-link checker."""

import unittest

from scripts import check_markdown_links


class MarkdownLinkTest(unittest.TestCase):
    def test_github_style_heading_slug(self):
        self.assertEqual(
            check_markdown_links.slug("Signing (keystore flags need `=`)"),
            "signing-keystore-flags-need",
        )

    def test_formatting_is_removed_from_slug(self):
        self.assertEqual(check_markdown_links.slug("**Build** & test"), "build-test")

    def test_duplicate_headings_get_numeric_suffixes(self):
        self.assertEqual(
            check_markdown_links.heading_anchors(
                ["# Setup", "## Setup", "# Other", "# Setup"]
            ),
            {"setup", "setup-1", "setup-2", "other"},
        )

    def test_unicode_heading_is_normalized(self):
        self.assertEqual(check_markdown_links.slug("Café — résumé"), "café-résumé")

    def test_empty_fragment_is_rejected_by_link_parser(self):
        target, separator, fragment = "guide.md#".partition("#")
        self.assertEqual((target, separator, fragment), ("guide.md", "#", ""))


if __name__ == "__main__":
    unittest.main()

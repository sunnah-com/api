#!/usr/bin/env python3
"""Validate that OpenAPI spec paths match the Flask routes declared in main.py.

Fails (exit 1) if any Flask route is missing from the spec, or vice versa.
This prevents `spec.v1.yml` from drifting out of sync with the actual API.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

import yaml

REPO_ROOT = Path(__file__).resolve().parent.parent
MAIN_PY = REPO_ROOT / "main.py"
SPEC_YML = REPO_ROOT / "spec.v1.yml"

ROUTE_RE = re.compile(r"""@app\.route\(\s*["']([^"']+)["']""")
FLASK_PARAM_RE = re.compile(r"<(?:[^:>]+:)?[^>]+>")
SPEC_PARAM_RE = re.compile(r"\{[^}]+\}")

API_PREFIX = "/v1"
PARAM_PLACEHOLDER = "{}"


def _normalize(route: str, param_re: re.Pattern[str]) -> str:
    """Strip the API prefix and replace path params with a common placeholder.

    Route params are compared positionally so that Flask's `<string:name>` and
    the spec's `{collectionName}` are treated as equal.
    """
    if route.startswith(API_PREFIX):
        route = route[len(API_PREFIX):] or "/"
    return param_re.sub(PARAM_PLACEHOLDER, route)


def flask_routes(path: Path) -> set[str]:
    return {
        _normalize(r, FLASK_PARAM_RE)
        for r in ROUTE_RE.findall(path.read_text())
    }


def spec_paths(path: Path) -> set[str]:
    spec = yaml.safe_load(path.read_text())
    return {
        _normalize(p, SPEC_PARAM_RE)
        for p in spec.get("paths", {}).keys()
    }


def main() -> int:
    flask = flask_routes(MAIN_PY)
    spec = spec_paths(SPEC_YML)

    missing_in_spec = flask - spec
    missing_in_code = spec - flask

    if not missing_in_spec and not missing_in_code:
        print(f"OK: {len(flask)} routes match between main.py and spec.v1.yml.")
        return 0

    if missing_in_spec:
        print("ERROR: Flask routes missing from spec.v1.yml:", file=sys.stderr)
        for r in sorted(missing_in_spec):
            print(f"  - {r}", file=sys.stderr)

    if missing_in_code:
        print("ERROR: Spec paths with no matching Flask route:", file=sys.stderr)
        for r in sorted(missing_in_code):
            print(f"  - {r}", file=sys.stderr)

    print(
        "\nUpdate spec.v1.yml (or the route) so they match. "
        "See https://sunnah.stoplight.io/docs/api/ for the published docs.",
        file=sys.stderr,
    )
    return 1


if __name__ == "__main__":
    sys.exit(main())

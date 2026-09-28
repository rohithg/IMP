#!/usr/bin/env python3
"""Validate metrics YAML has required fields and unique names."""

from __future__ import annotations

import sys
from pathlib import Path

try:
    import yaml
except ImportError:
    print("PyYAML not installed; skipping strict parse. Checking structure manually.")
    yaml = None

ROOT = Path(__file__).resolve().parents[1]
METRICS_FILE = ROOT / "metrics" / "metrics.yml"
REQUIRED = {"name", "label", "description", "owner", "model", "type", "sql", "grain"}


def main() -> int:
    text = METRICS_FILE.read_text()
    if yaml is None:
        assert "metrics:" in text
        print("OK (basic check): metrics.yml present")
        return 0

    data = yaml.safe_load(text)
    metrics = data.get("metrics") or []
    names = []
    for m in metrics:
        missing = REQUIRED - set(m)
        if missing:
            raise SystemExit(f"Metric {m.get('name')} missing {missing}")
        names.append(m["name"])
    if len(names) != len(set(names)):
        raise SystemExit("Duplicate metric names")
    print(f"OK: {len(names)} metrics validated")
    return 0


if __name__ == "__main__":
    sys.exit(main())

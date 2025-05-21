#!/usr/bin/env python3
"""
Recursively reads all files in a given folder and writes their paths and contents into one or more JSON files.
Each output JSON will not exceed 512 MB. If more than 20 files are needed, the script will error out.
Supports a hardcoded blacklist of file patterns/substrings to skip.
"""
import os
import json
import sys
import argparse
import base64
import fnmatch

# Constants
MAX_SIZE = 512 * 1024 * 1024   # 512 MB
MAX_FILES = 20

# Hardcoded blacklist: skip any file whose relative path matches or contains these patterns
BLACKLIST = [
    '.git',            # Git directory or files
    '.vscode', 
    '.fvm',
    '.dart_tool',
    'agents.py',
    'AGENTS.md',
    'LICENSE',
    'CHANGELOG.md'
    'README.md'
]


def serialize_entry(path, root):
    """
    Read a file and return a dict with its relative path and content.
    Binary files are base64-encoded.
    """
    full_path = os.path.join(root, path)
    with open(full_path, 'rb') as f:
        data = f.read()
        try:
            text = data.decode('utf-8')
        except UnicodeDecodeError:
            text = base64.b64encode(data).decode('ascii')
    return {"path": path, "content": text}


def chunk_and_write(entries, out_prefix):
    """
    Chunk entries into batches that fit MAX_SIZE and write JSON files.
    """
    batches = []
    current = []
    current_size = 2  # for the '[' and ']' in JSON

    for entry in entries:
        entry_json = json.dumps(entry, separators=(',', ':'))
        size = len(entry_json.encode('utf-8')) + 1  # +1 for comma

        if current and current_size + size > MAX_SIZE:
            batches.append(current)
            current = []
            current_size = 2

        if size > MAX_SIZE:
            raise RuntimeError(f"Single entry {entry['path']} exceeds 512MB limit")

        current.append(entry)
        current_size += size

    if current:
        batches.append(current)

    if len(batches) > MAX_FILES:
        raise RuntimeError(f"Need {len(batches)} files to store data, exceeds limit of {MAX_FILES}")

    for i, batch in enumerate(batches, 1):
        out_file = f"{out_prefix}_{i}.json"
        with open(out_file, 'w', encoding='utf-8') as f:
            json.dump(batch, f, ensure_ascii=False, separators=(',', ':'))
        print(f"Written {out_file} ({len(batch)} entries)")


def gather_paths(root):
    """
    Walk through the directory and collect relative file paths,
    skipping any that match the blacklist.
    """
    paths = []
    for dirpath, _, filenames in os.walk(root):
        for fname in filenames:
            rel = os.path.relpath(os.path.join(dirpath, fname), root)
            skip = False
            for pat in BLACKLIST:
                # wildcard patterns
                if '*' in pat:
                    if fnmatch.fnmatch(rel, pat): skip = True; break
                else:
                    if pat in rel: skip = True; break
            if skip:
                continue
            paths.append(rel)
    return sorted(paths)


def main():
    parser = argparse.ArgumentParser(
        description="Merge folder files into JSON, splitting if >512MB"
    )
    parser.add_argument(
        "root_dir", help="Root directory to scan"
    )
    parser.add_argument(
        "output_prefix", help="Prefix for output JSON files"
    )
    args = parser.parse_args()

    if not os.path.isdir(args.root_dir):
        print(f"Error: {args.root_dir} is not a directory.", file=sys.stderr)
        sys.exit(1)

    paths = gather_paths(args.root_dir)
    entries = [serialize_entry(p, args.root_dir) for p in paths]
    chunk_and_write(entries, args.output_prefix)


if __name__ == '__main__':
    main()
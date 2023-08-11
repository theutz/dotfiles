#!/bin/sh

echo "== Installing crates =="
cargo install bob-nvim
echo "== Crates installed =="

if ! command -v nvim >/dev/null; then
	bob use stable
fi

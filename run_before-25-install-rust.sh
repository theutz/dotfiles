#!/bin/sh

echo "== Checking on rust install =="
if [ ! -d "$HOME"/.cargo ] && [ ! -d "$HOME/.rustup" ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
echo "== Rust installed =="

cat "$VIM_DIR/README.index.md" >> "$VIM_DIR/README.md"
cat "$VIM_DIR/README.content.md" >> "$VIM_DIR/README.md"

rm "$VIM_DIR/README.index.md" "$VIM_DIR/README.content.md"

if [ -n "$DOTVIM_DEV" ]; then
  cp "$VIM_DIR/README.md" .
fi

#!/bin/bash
echo "🔄 Updating Analog IC Tree site..."

# Find the NEWEST analog-ic-tree file
LATEST_TREE=$(ls -t /c/Users/moazk/Downloads/analog-ic-tree*.html 2>/dev/null | head -1)

if [ -n "$LATEST_TREE" ]; then
  cp "$LATEST_TREE" ./index.html && echo "✓ Knowledge Tree updated (from: $(basename $LATEST_TREE))"
else
  echo "✗ Could not find analog-ic-tree file"
fi

# Find the NEWEST books file
LATEST_BOOKS=$(ls -t /c/Users/moazk/Downloads/books*.html 2>/dev/null | head -1)

if [ -n "$LATEST_BOOKS" ]; then
  cp "$LATEST_BOOKS" ./books.html && echo "✓ Books Library updated (from: $(basename $LATEST_BOOKS))"
else
  echo "✗ Could not find books file"
fi

cp /c/Users/moazk/Downloads/B.\ Razavi*.pdf ./ 2>/dev/null && echo "✓ PDFs copied"

echo ""
echo "✨ Done! Now run:"
echo "  git add ."
echo "  git commit -m 'update site'"
echo "  git push"

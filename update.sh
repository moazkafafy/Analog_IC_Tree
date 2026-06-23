#!/bin/bash
echo "🔄 Updating Analog IC Tree site..."

# Find the NEWEST analog-ic-tree file by modification time
LATEST_FILE=$(ls -t /c/Users/moazk/Downloads/analog-ic-tree*.html 2>/dev/null | head -1)

if [ -n "$LATEST_FILE" ]; then
  cp "$LATEST_FILE" ./index.html && echo "✓ Knowledge Tree updated (from: $(basename $LATEST_FILE))"
else
  echo "✗ Could not find analog-ic-tree file"
  exit 1
fi

# Find the NEWEST books file by modification time
LATEST_BOOKS=$(ls -t /c/Users/moazk/Downloads/books*.html 2>/dev/null | head -1)

if [ -n "$LATEST_BOOKS" ]; then
  cp "$LATEST_BOOKS" ./books.html && echo "✓ Books Library updated (from: $(basename $LATEST_BOOKS))"
fi

# Copy PDFs if they exist
cp /c/Users/moazk/Downloads/B.\ Razavi*.pdf ./ 2>/dev/null && echo "✓ PDFs copied" || true

echo ""
echo "✨ Files copied! Cleaning up old downloads..."

# DELETE ALL OLD NUMBERED COPIES from Downloads
rm -f /c/Users/moazk/Downloads/analog-ic-tree\ \(*\).html 2>/dev/null && echo "✓ Cleaned old analog-ic-tree files"
rm -f /c/Users/moazk/Downloads/books\ \(*\).html 2>/dev/null && echo "✓ Cleaned old books files"

echo ""
echo "📝 Now run these commands:"
echo "  git add ."
echo "  git commit -m 'update site'"
echo "  git push"

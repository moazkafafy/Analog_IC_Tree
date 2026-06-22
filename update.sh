#!/bin/bash
echo "🔄 Updating Analog IC Tree site..."

# Find the NEWEST analog-ic-tree file (by modification time)
LATEST_FILE=$(ls -t /c/Users/moazk/Downloads/analog-ic-tree*.html 2>/dev/null | head -1)

if [ -n "$LATEST_FILE" ]; then
  cp "$LATEST_FILE" ./index.html && echo "✓ Knowledge Tree updated (from: $(basename $LATEST_FILE))"
else
  echo "✗ Could not find analog-ic-tree file"
fi

cp /c/Users/moazk/Downloads/books.html ./books.html && echo "✓ Books Library updated" || echo "✗ Could not find books.html"

cp /c/Users/moazk/Downloads/razavi-fundamentals-2014.pdf ./ 2>/dev/null && echo "✓ Fundamentals PDF copied"
cp /c/Users/moazk/Downloads/razavi-design-cmos-2017.pdf ./ 2>/dev/null && echo "✓ Design CMOS PDF copied"

echo ""
echo "✨ Done! Now run:"
echo "  git add ."
echo "  git commit -m 'update site'"
echo "  git push"

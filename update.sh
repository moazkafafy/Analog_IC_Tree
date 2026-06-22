#!/bin/bash
# Auto-update script for Analog IC Tree site

echo "🔄 Updating Analog IC Tree site..."

# Copy latest analog_ic_tree file (handles any version number with wildcard)
cp /c/Users/moazk/Downloads/analog_ic_tree*.html ./index.html && echo "✓ Knowledge Tree updated" || echo "✗ Could not find analog_ic_tree file"

# Copy books file  
cp /c/Users/moazk/Downloads/books.html ./books.html && echo "✓ Books Library updated" || echo "✗ Could not find books.html"

# Copy PDFs (optional - won't fail if missing)
cp /c/Users/moazk/Downloads/razavi-fundamentals-2014.pdf ./ 2>/dev/null && echo "✓ Fundamentals PDF copied"
cp /c/Users/moazk/Downloads/razavi-design-cmos-2017.pdf ./ 2>/dev/null && echo "✓ Design CMOS PDF copied"

echo ""
echo "✨ Done! Now run in Git Bash:"
echo "  git add ."
echo "  git commit -m 'update site'"
echo "  git push"

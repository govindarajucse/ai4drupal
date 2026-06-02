#!/bin/bash
# security-scan.sh - Quick security scan for Drupal code
# Usage: ./security-scan.sh [path]

set -e

TARGET_PATH=${1:-"web/modules/custom/"}

echo "=========================================="
echo "Drupal Security Scan"
echo "Target: $TARGET_PATH"
echo "=========================================="

ISSUES=0

echo ""
echo "1. Checking for dangerous functions..."
echo "--------------------------------------"

# Check for direct superglobal access
if grep -rn '\$_GET\|\$_POST\|\$_REQUEST\|\$_COOKIE' "$TARGET_PATH" --include="*.php" --include="*.module" 2>/dev/null; then
    echo "⚠ Direct superglobal access found"
    ISSUES=$((ISSUES + 1))
else
    echo "✓ No direct superglobal access"
fi

echo ""
echo "2. Checking for SQL injection risks..."
echo "--------------------------------------"

# Check for string concatenation in queries
if grep -rn 'db_query.*\$\|->query.*\.\s*\$' "$TARGET_PATH" --include="*.php" --include="*.module" 2>/dev/null; then
    echo "⚠ Potential SQL injection found"
    ISSUES=$((ISSUES + 1))
else
    echo "✓ No obvious SQL injection patterns"
fi

echo ""
echo "3. Checking for XSS risks..."
echo "--------------------------------------"

# Check for unescaped output
if grep -rn 'echo\s*\$\|print\s*\$' "$TARGET_PATH" --include="*.php" --include="*.module" 2>/dev/null; then
    echo "⚠ Potential XSS - unescaped output"
    ISSUES=$((ISSUES + 1))
else
    echo "✓ No obvious XSS patterns"
fi

echo ""
echo "4. Checking for hardcoded credentials..."
echo "--------------------------------------"

# Check for potential credentials
if grep -rni 'password\s*=\s*["\x27][^"\x27]*["\x27]\|api_key\s*=\s*["\x27]' "$TARGET_PATH" --include="*.php" --include="*.module" --include="*.yml" 2>/dev/null; then
    echo "⚠ Potential hardcoded credentials"
    ISSUES=$((ISSUES + 1))
else
    echo "✓ No obvious hardcoded credentials"
fi

echo ""
echo "=========================================="
echo "Security Scan Summary"
echo "=========================================="
echo "Issues found: $ISSUES"

if [ $ISSUES -gt 0 ]; then
    echo "Review the findings above."
    exit 1
else
    echo "No obvious security issues detected."
    exit 0
fi

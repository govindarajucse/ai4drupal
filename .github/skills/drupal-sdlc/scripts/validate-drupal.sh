#!/bin/bash
# validate-drupal.sh - Drupal validation script for SDLC gates
# Run this script at each phase transition

set -e

echo "=========================================="
echo "AI4Drupal SDLC Validation Script"
echo "=========================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track overall status
ERRORS=0
WARNINGS=0

# Function to print status
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✓ $2${NC}"
    else
        echo -e "${RED}✗ $2${NC}"
        ERRORS=$((ERRORS + 1))
    fi
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
    WARNINGS=$((WARNINGS + 1))
}

echo ""
echo "1. Checking Drupal coding standards..."
echo "--------------------------------------"

if command -v phpcs &> /dev/null; then
    if phpcs --standard=Drupal,DrupalPractice --extensions=php,module,inc,install,test,profile,theme web/modules/custom/ 2>/dev/null; then
        print_status 0 "PHPCS: No coding standard violations"
    else
        print_status 1 "PHPCS: Coding standard violations found"
    fi
else
    print_warning "PHPCS not installed, skipping..."
fi

echo ""
echo "2. Running PHPStan analysis..."
echo "--------------------------------------"

if command -v phpstan &> /dev/null; then
    if phpstan analyse web/modules/custom/ --level=6 --no-progress 2>/dev/null; then
        print_status 0 "PHPStan: No issues found"
    else
        print_status 1 "PHPStan: Issues found"
    fi
else
    print_warning "PHPStan not installed, skipping..."
fi

echo ""
echo "3. Checking for security updates..."
echo "--------------------------------------"

if command -v drush &> /dev/null; then
    SECURITY_UPDATES=$(drush pm:security 2>/dev/null || echo "error")
    if [[ "$SECURITY_UPDATES" == *"No known"* ]] || [[ "$SECURITY_UPDATES" == "" ]]; then
        print_status 0 "Drush: No known security vulnerabilities"
    else
        print_status 1 "Drush: Security updates available"
    fi
else
    print_warning "Drush not available, skipping..."
fi

echo ""
echo "4. Checking composer dependencies..."
echo "--------------------------------------"

if command -v composer &> /dev/null; then
    if composer audit 2>/dev/null; then
        print_status 0 "Composer: No known vulnerabilities"
    else
        print_status 1 "Composer: Vulnerabilities found"
    fi
else
    print_warning "Composer not available, skipping..."
fi

echo ""
echo "5. Running PHPUnit tests..."
echo "--------------------------------------"

if command -v phpunit &> /dev/null; then
    if phpunit --group=custom --no-coverage 2>/dev/null; then
        print_status 0 "PHPUnit: All tests passing"
    else
        print_status 1 "PHPUnit: Test failures"
    fi
else
    print_warning "PHPUnit not available, skipping..."
fi

echo ""
echo "=========================================="
echo "Validation Summary"
echo "=========================================="
echo -e "Errors:   ${RED}$ERRORS${NC}"
echo -e "Warnings: ${YELLOW}$WARNINGS${NC}"
echo ""

if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}VALIDATION FAILED${NC}"
    echo "Fix the errors above before proceeding."
    exit 1
else
    echo -e "${GREEN}VALIDATION PASSED${NC}"
    exit 0
fi

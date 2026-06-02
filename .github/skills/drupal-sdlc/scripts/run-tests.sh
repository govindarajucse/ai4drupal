#!/bin/bash
# run-tests.sh - Run Drupal tests with coverage
# Usage: ./run-tests.sh [module_name] [test_type]

set -e

MODULE=${1:-"custom"}
TEST_TYPE=${2:-"all"}

echo "=========================================="
echo "Running Drupal Tests"
echo "Module: $MODULE"
echo "Type: $TEST_TYPE"
echo "=========================================="

# Function to run specific test type
run_unit_tests() {
    echo ""
    echo "Running Unit Tests..."
    phpunit web/modules/custom/$MODULE/tests/src/Unit/ --no-coverage
}

run_kernel_tests() {
    echo ""
    echo "Running Kernel Tests..."
    phpunit web/modules/custom/$MODULE/tests/src/Kernel/ --no-coverage
}

run_functional_tests() {
    echo ""
    echo "Running Functional Tests..."
    phpunit web/modules/custom/$MODULE/tests/src/Functional/ --no-coverage
}

run_all_tests() {
    echo ""
    echo "Running All Tests..."
    phpunit web/modules/custom/$MODULE --no-coverage
}

run_with_coverage() {
    echo ""
    echo "Running Tests with Coverage..."
    phpunit web/modules/custom/$MODULE \
        --coverage-html=coverage/ \
        --coverage-clover=coverage/clover.xml
    
    echo ""
    echo "Coverage report: coverage/index.html"
}

# Main execution
case $TEST_TYPE in
    unit)
        run_unit_tests
        ;;
    kernel)
        run_kernel_tests
        ;;
    functional)
        run_functional_tests
        ;;
    coverage)
        run_with_coverage
        ;;
    all|*)
        run_all_tests
        ;;
esac

echo ""
echo "=========================================="
echo "Tests Complete"
echo "=========================================="

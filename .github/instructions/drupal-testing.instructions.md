---
description: "Use when writing Drupal tests, test plans, or debugging test failures. Covers PHPUnit, Functional, Kernel, and JavaScript tests."
applyTo: ["**/tests/**/*.php", "**/*Test.php"]
---
# Drupal Testing Guidelines

## Test Types Overview

| Type | Base Class | Bootstrap | Speed | Use Case |
|------|------------|-----------|-------|----------|
| Unit | `UnitTestCase` | None | Fast | Pure PHP logic |
| Kernel | `KernelTestBase` | Partial | Medium | Services, DB, plugins |
| Functional | `BrowserTestBase` | Full | Slow | User interactions |
| FunctionalJS | `WebDriverTestBase` | Full + JS | Slowest | JavaScript behaviors |

## Test Directory Structure
```
my_module/
└── tests/
    └── src/
        ├── Unit/
        │   └── MyServiceTest.php
        ├── Kernel/
        │   └── MyEntityTest.php
        ├── Functional/
        │   └── MyFormTest.php
        └── FunctionalJavascript/
            └── MyAjaxTest.php
```

## Unit Test Example
```php
namespace Drupal\Tests\my_module\Unit;

use Drupal\Tests\UnitTestCase;
use Drupal\my_module\Service\Calculator;

/**
 * Tests the Calculator service.
 *
 * @group my_module
 * @coversDefaultClass \Drupal\my_module\Service\Calculator
 */
class CalculatorTest extends UnitTestCase {

  private Calculator $calculator;

  protected function setUp(): void {
    parent::setUp();
    $this->calculator = new Calculator();
  }

  /**
   * @covers ::add
   * @dataProvider providerAdd
   */
  public function testAdd(int $a, int $b, int $expected): void {
    $this->assertEquals($expected, $this->calculator->add($a, $b));
  }

  public static function providerAdd(): array {
    return [
      'positive numbers' => [2, 3, 5],
      'negative numbers' => [-2, -3, -5],
      'mixed numbers' => [-2, 5, 3],
      'zeros' => [0, 0, 0],
    ];
  }
}
```

## Kernel Test Example
```php
namespace Drupal\Tests\my_module\Kernel;

use Drupal\KernelTests\KernelTestBase;
use Drupal\my_module\Entity\MyEntity;

/**
 * Tests MyEntity functionality.
 *
 * @group my_module
 */
class MyEntityTest extends KernelTestBase {

  protected static $modules = [
    'system',
    'user',
    'my_module',
  ];

  protected function setUp(): void {
    parent::setUp();
    $this->installEntitySchema('user');
    $this->installEntitySchema('my_entity');
    $this->installConfig(['my_module']);
  }

  public function testEntityCreation(): void {
    $entity = MyEntity::create([
      'name' => 'Test Entity',
      'status' => TRUE,
    ]);
    $entity->save();

    $this->assertNotNull($entity->id());
    $this->assertEquals('Test Entity', $entity->getName());
  }
}
```

## Functional Test Example
```php
namespace Drupal\Tests\my_module\Functional;

use Drupal\Tests\BrowserTestBase;

/**
 * Tests the admin form functionality.
 *
 * @group my_module
 */
class AdminFormTest extends BrowserTestBase {

  protected static $modules = ['my_module'];

  protected $defaultTheme = 'stark';

  protected function setUp(): void {
    parent::setUp();
    $this->drupalLogin($this->createUser(['administer my_module']));
  }

  public function testFormSubmission(): void {
    $this->drupalGet('/admin/config/my-module/settings');
    $this->assertSession()->statusCodeEquals(200);
    $this->assertSession()->pageTextContains('My Module Settings');

    $this->submitForm([
      'enabled' => TRUE,
      'api_endpoint' => 'https://api.example.com',
    ], 'Save configuration');

    $this->assertSession()->pageTextContains('Configuration saved.');
  }

  public function testAccessDenied(): void {
    $this->drupalLogout();
    $this->drupalGet('/admin/config/my-module/settings');
    $this->assertSession()->statusCodeEquals(403);
  }
}
```

## FunctionalJavascript Test Example
```php
namespace Drupal\Tests\my_module\FunctionalJavascript;

use Drupal\FunctionalJavascriptTests\WebDriverTestBase;

/**
 * Tests AJAX form behavior.
 *
 * @group my_module
 */
class AjaxFormTest extends WebDriverTestBase {

  protected static $modules = ['my_module'];

  protected $defaultTheme = 'stark';

  public function testAjaxCallback(): void {
    $this->drupalLogin($this->createUser(['access content']));
    $this->drupalGet('/my-module/ajax-form');

    $page = $this->getSession()->getPage();
    $page->selectFieldOption('type', 'article');

    $this->assertSession()->assertWaitOnAjaxRequest();
    $this->assertSession()->pageTextContains('Article options loaded');
  }
}
```

## Running Tests
```bash
# Run all module tests
phpunit web/modules/custom/my_module

# Run specific test group
phpunit --group=my_module

# Run single test class
phpunit web/modules/custom/my_module/tests/src/Unit/CalculatorTest.php

# Run with coverage
phpunit --coverage-html coverage/ --group=my_module

# Run Drupal's test runner
drush test:run my_module
```

## Best Practices
- One assertion concept per test method
- Use data providers for multiple scenarios
- Mock external dependencies in unit tests
- Use traits for common test setup
- Name tests descriptively: `testUserCannotAccessAdminWithoutPermission`
- Clean up created entities in tearDown
- Use `@group` annotation for filtering
- Aim for 80%+ code coverage

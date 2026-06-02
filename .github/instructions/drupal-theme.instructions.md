---
description: "Use when creating or modifying Drupal themes, Twig templates, CSS, or JavaScript. Covers theme structure, preprocess functions, and frontend best practices."
applyTo: "web/themes/custom/**"
---
# Drupal Theme Guidelines

## Theme Structure
```
my_theme/
├── my_theme.info.yml           # Theme definition
├── my_theme.theme              # Preprocess functions
├── my_theme.libraries.yml      # Asset libraries
├── my_theme.breakpoints.yml    # Responsive breakpoints
├── config/
│   └── install/                # Default config
├── css/
│   ├── base/                   # Reset, typography
│   ├── components/             # Component styles
│   └── layout/                 # Layout styles
├── js/
│   └── scripts.js              # JavaScript
├── templates/
│   ├── layout/                 # Page layouts
│   ├── block/                  # Block templates
│   ├── node/                   # Node templates
│   ├── field/                  # Field templates
│   └── navigation/             # Menu templates
├── images/                     # Theme images
└── logo.svg                    # Theme logo
```

## Theme Info File
```yaml
# my_theme.info.yml
name: My Theme
type: theme
description: 'Custom theme for the site'
core_version_requirement: ^10 || ^11
base theme: false

libraries:
  - my_theme/global

regions:
  header: Header
  content: Content
  sidebar: Sidebar
  footer: Footer
```

## Library Definition
```yaml
# my_theme.libraries.yml
global:
  version: VERSION
  css:
    theme:
      css/base/reset.css: {}
      css/layout/layout.css: {}
      css/components/components.css: {}
  js:
    js/scripts.js: {}
  dependencies:
    - core/drupal
    - core/once

component-slider:
  version: VERSION
  css:
    component:
      css/components/slider.css: {}
  js:
    js/slider.js: {}
  dependencies:
    - core/drupal
```

## Preprocess Functions
```php
// my_theme.theme

use Drupal\Core\Url;
use Drupal\node\NodeInterface;

/**
 * Implements hook_preprocess_HOOK() for html.html.twig.
 */
function my_theme_preprocess_html(array &$variables): void {
  $variables['attributes']['class'][] = 'my-theme';
}

/**
 * Implements hook_preprocess_HOOK() for node.html.twig.
 */
function my_theme_preprocess_node(array &$variables): void {
  $node = $variables['node'];
  if ($node instanceof NodeInterface) {
    $variables['content_type'] = $node->bundle();
  }
}

/**
 * Implements hook_preprocess_HOOK() for block.html.twig.
 */
function my_theme_preprocess_block(array &$variables): void {
  $variables['attributes']['class'][] = 'block--' . str_replace('_', '-', $variables['plugin_id']);
}
```

## Twig Template Best Practices
```twig
{# node--article.html.twig #}
{% set classes = [
  'node',
  'node--type-' ~ node.bundle|clean_class,
  node.isPromoted() ? 'node--promoted',
  node.isSticky() ? 'node--sticky',
  not node.isPublished() ? 'node--unpublished',
  view_mode ? 'node--view-mode-' ~ view_mode|clean_class,
] %}

<article{{ attributes.addClass(classes) }}>
  {{ title_prefix }}
  {% if label and not page %}
    <h2{{ title_attributes }}>
      <a href="{{ url }}" rel="bookmark">{{ label }}</a>
    </h2>
  {% endif %}
  {{ title_suffix }}

  <div{{ content_attributes.addClass('node__content') }}>
    {{ content }}
  </div>
</article>
```

## JavaScript Pattern
```javascript
// js/scripts.js
(function (Drupal, once) {
  'use strict';

  Drupal.behaviors.myThemeBehavior = {
    attach: function (context, settings) {
      once('my-behavior', '.my-element', context).forEach(function (element) {
        // Initialize component
        element.addEventListener('click', function (event) {
          // Handle click
        });
      });
    },
    detach: function (context, settings, trigger) {
      if (trigger === 'unload') {
        // Cleanup
      }
    }
  };

})(Drupal, once);
```

## Best Practices
- Use BEM naming for CSS classes
- Leverage Drupal's `once()` for JavaScript initialization
- Use `attach_library` in preprocess, not in templates
- Keep templates logic-free, use preprocess for data
- Use CSS custom properties for theming
- Ensure WCAG 2.1 AA accessibility compliance
- Test across supported browsers

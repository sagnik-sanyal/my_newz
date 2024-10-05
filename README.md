# Mynewz

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

README Generated by the [Very Good CLI][very_good_cli_link] and ChatGPT (Disclaimer) 🤖

MyNewZ - Get news info instantly

## 🚨 Important

(🚨 **Please note that certain credentials have been removed from the codebase for security reasons.**)

(🚨 **Install the app on your device to see the full functionality.**)

---

## 📱 Features
- State Management with Provider: Efficient and scalable state management using the Provider package for streamlined app-wide data management.
- Robust Error Handling: Custom sealed classes for error handling ensure smooth and predictable failure management.
- API Response Caching: Fast access to news with custom API response caching using the ObjectBox database.
- Image Caching: Optimized image loading and caching for a smooth browsing experience, even in low connectivity conditions.
- Beautiful Snackbars: Custom-designed snackbars for non-intrusive user feedback with a clean, modern look.
- Shimmer Loaders: Eye-catching shimmer loaders provide a visually appealing experience while content loads in the background.
- Reusable Widgets: A modular design with reusable and scalable widgets, making it easier to extend the app and add new features.

---

## Getting Started 🚀

This project contains 3 flavors:

- development (only having the configurations atm)
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Running any flavor is as simple as running the following command
$ flutter run --flavor development --target lib/main_{env_name}.dart --dart-define-from-file=".env.{env_name}.json"

```
[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli

# Flutter Task – [Your Name]

This project is a Flutter-based mobile application developed as part of a technical assessment. It demonstrates UI implementation based on provided designs, local data management using SQLite, and clean code architecture with state management.

## 📱 Features

- Pixel-perfect UI implementation based on provided designs
- Local data storage using SQLite
- Filtering screen for real estate listings
- State management using `flutter_bloc` and `provider`
- Dependency injection with `get_it` and `injectable`
- Localization support
- Custom fonts and icons
- Cached image loading for performance

## 🛠️ Tech Stack & Dependencies

| Package | Description |
|--------|-------------|
| [`flutter_localizations`](https://pub.devation) support |
| `intl` | Internationalization and localization utilities |
| [`sqflite`](https://pub.dev/packages/sq) | Local data storage in Flutter applications |
| `flutter_bloc` | State management using BLoC pattern |
| `provider` | Lightweight state management |
| `get_it` | Service locator for dependency injection |
| `injectable` | Code generator for `get_it` |
| [`path`](httpsmanipulation utilities |
| [`google_fonts`](https://pub.dev/packages
| [`equatable`](https://pub.dev/packages/equatablet objects |

## 📂 Project Structure
lib/
├── core/                   # Core utilities and shared resources
│   ├── app_localization_provider/  # Localization setup and providers
│   ├── bases/                      # Base classes (e.g., base widgets, base cubits)
│   ├── colors/                     # App color definitions
│   ├── constants/                  # Constant values used across the app
│   ├── database_result/           # Result wrappers for DB operations
│   ├── di/                         # Dependency injection setup
│   ├── l10n/                       # Localization files
│   ├── routing/                    # App routing and navigation
│   ├── theme/                      # App-wide theming
│   └── widgets/                    # Reusable UI components
│
├── data/                   # Data layer (implementation)
│   ├── db/                         # SQLite database helpers and DAOs
│   ├── dummy/                      # Dummy/mock data for testing
│   ├── models/                     # Data models
│   └── repos_implementations/     # Implementations of repositories
│
├── domain/                # Domain layer (business logic)
│   ├── repos_contracts/           # Abstract repository contracts
│   │   ├── categories_repo/
│   │   ├── estates_repo/
│   │   ├── plans_repo/
│   │   ├── products_repo/
│   │   └── subcategory_repo/
│   └── base_repo.dart             # Base repository interface
│
├── ui/                    # Presentation layer
│   ├── filter/                    # Filter screen UI and logic
│   ├── home/                      # Home screen UI and logic
│   └── plans/                     # Plans screen UI and logic
│
└── main.dart              # App entry point

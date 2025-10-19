# Flutter Task – Mohammed Khalil

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

Below are the main packages used in this project, along with a brief description of their purpose:

| Package | Description |
|--------|-------------|
| `flutter_localizations` | Enables localization and internationalization support in Flutter apps. |
| `intl` | Provides utilities for internationalization, such as date and number formatting. |
| `sqflite` | SQLite plugin for Flutter, used for local data storage and querying. |
| `flutter_bloc` | State management library based on the BLoC (Business Logic Component) pattern. |
| `provider` | A simple and efficient dependency injection and state management solution. |
| `get_it` | A service locator for dependency injection, helping manage app-wide instances. |
| `injectable` | Code generator for `get_it` to simplify and automate dependency injection setup. |
| `path` | Provides utilities for manipulating file system paths in a platform-independent way. |
| `google_fonts` | Access to hundreds of free fonts from Google Fonts for custom typography. |
| `equatable` | Simplifies equality comparisons between Dart objects, useful in state management. |

## 📂 Project Structure
The project follows a clean architecture approach, organized into multiple layers for better scalability and maintainability:

```text
lib/
├── core/                         # Core utilities and shared resources
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
├── data/                         # Data layer (implementation)
│   ├── db/                         # SQLite database helpers and DAOs
│   ├── dummy/                      # Dummy/mock data for testing
│   ├── models/                     # Data models
│   └── repos_implementations/     # Implementations of repositories
│
├── domain/                       # Domain layer (business logic)
│   ├── repos_contracts/           # Abstract repository contracts
│   │   ├── categories_repo/
│   │   ├── estates_repo/
│   │   ├── plans_repo/
│   │   ├── products_repo/
│   │   └── subcategory_repo/
│   └── base_repo.dart             # Base repository interface
│
├── ui/                           # Presentation layer
│   ├── filter/                    # Filter screen UI and logic
│   ├── home/                      # Home screen UI and logic
│   └── plans/                     # Plans screen UI and logic
│
└── main.dart                     # App entry point
```
## Imagined Database Look (Class Diagram)
<img width="568" height="746" alt="Otex Test Database Class diagram" src="https://github.com/user-attachments/assets/8900bdda-9790-4383-a6e6-0f76a3719f9e" />

## Task Demo:

https://github.com/user-attachments/assets/32d79558-19b0-4d45-a2cf-3c0138a2f91e




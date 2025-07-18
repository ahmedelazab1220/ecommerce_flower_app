![Dart](https://img.shields.io/badge/dart-%230175C2.svg?logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?logo=Flutter&logoColor=white)
![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?logo=figma&logoColor=white)
![Android Studio](https://img.shields.io/badge/Android%20Studio-3DDC84.svg?logo=android-studio&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?logo=visual-studio-code&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?logo=github&logoColor=white)
![Slack](https://img.shields.io/badge/Slack-4A154B?logo=slack&logoColor=white)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/ahmedelazab1220/ecommerce_flower_app)

# Overview

The E-commerce Flower App is a comprehensive mobile application built with Flutter that enables users to browse and purchase flower products. This document provides a high-level overview of the application's architecture, key features, and core systems to help developers understand the codebase.

# Purpose and Scope

This overview covers the fundamental structure of the application, its architectural patterns, and the interaction between core components. It serves as an entry point for understanding how various features like authentication, product browsing, shopping cart, and checkout functionality are organized and connected. For detailed information about specific subsystems, refer to the dedicated wiki pages mentioned throughout this document.

# Application Architecture

The application follows a clean architecture approach with clear separation of concerns across multiple layers. This ensures maintainability, testability, and scalability of the codebase.

![Application-Architecture](https://github.com/user-attachments/assets/4aa940f7-d8ed-40ba-9ee2-f22070c42542)

Sources:

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart)

- [`lib/core/utils/app_strater.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e334d23778c754add94c95cb662a31861f1/lib/core/utils/app_strater.dart)

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e334d23778c754add94c95cb662a31861f1/lib/core/utils/di/di.config.dart)

# Technology Stack

The application leverages a variety of modern libraries and frameworks:

| ****category**** | ****Technologies****
| :---: | :---: |
| `UI Framework` | `Flutter` |
| `State Management` | `Flutter BLoC/Cubit` |
| `Dependency Injection` | `GetIt & Injectable` |
| `Network Communication` |	`Dio & Retrofit` |
| `Local Storage` |	`Flutter Secure Storage, Shared Preferences, Hive` |
| `Analytics & Monitoring` | `Firebase Analytics, Firebase Crashlytics` |
| `Localization` | `Easy Localization` |
| `UI Components` |	`Flutter SVG, Cached Network Image, Carousel Slider` | 
|  `Location Services` |	`Geocoding, Location` |
| `Other Utilities` |	`Logger, Flutter ScreenUtil, Flutter Slidable` |

Sources:

- [`pubspec.yaml`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/pubspec.yaml)

- [`windows/flutter/generated_plugin_registrant.cc`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/windows/flutter/generated_plugin_registrant.cc#L9-L11)

- [`windows/flutter/generated_plugins.cmake`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/windows/flutter/generated_plugins.cmake#L5-L9)

- [`macos/Flutter/GeneratedPluginRegistrant.swift`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/macos/Flutter/GeneratedPluginRegistrant.swift#L8-L17)

# App Initialization Flow

The application follows a structured initialization process to ensure all required components are properly set up before presenting the UI to the user.

![App-Initialization-Flow](https://github.com/user-attachments/assets/30397d53-ab1f-4e79-b89e-c3ef64194c57)

Sources:

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L15-L29)

- [`lib/core/utils/app_strater.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/app_strater.dart#L14-L45)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L31-L56)

# Demo Video 

🌸 E-commerce Flower App Demo | Flutter Clean Architecture | Arabic & English Support

[![Demo Video](https://github.com/user-attachments/assets/57d0c7dc-4360-409a-bf8c-c1aa3d475e81)](https://www.youtube.com/watch?v=kt7Kp878Crs)

# Key Features and Modules

The application is organized into feature modules, each responsible for a specific functionality. The diagram below shows the main features and their relationships.

![Key-Features-and-Modules](https://github.com/user-attachments/assets/f7ea6e21-fb11-4063-9d87-2a3ad9a00e2b)

Sources:

- [`lib/core/utils/routes/routes.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/routes/routes.dart#L27-L107)

- [`lib/core/utils/l10n/locale_keys.g.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/l10n/locale_keys.g.dart#L5-L260)

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L300-L799)


# State Management Pattern

The application uses the BLoC/Cubit pattern for state management, providing a unidirectional data flow that makes the app's state predictable and maintainable.

![State-Management-Pattern](https://github.com/user-attachments/assets/e61f95a6-ba31-4614-8a03-908900947a0d)

Sources:

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L580-L796)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L19-L19)


# Dependency Injection System

The application uses GetIt and the Injectable package for dependency injection, allowing for loose coupling between components and easier testing.

![Dependency-Injection-System](https://github.com/user-attachments/assets/f07ecadf-64b9-41c6-ac66-9dd45a0515f0)

Sources:

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L300-L799)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L12-L12)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L19-L19)

# Localization System

The application supports multiple languages (English and Arabic) through easy_localization, allowing for seamless language switching.

![Localization-System](https://github.com/user-attachments/assets/ce8eada4-6ca4-47b4-8b08-fd9f2271bed1)

Sources:

- [`lib/core/utils/l10n/locale_keys.g.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/l10n/locale_keys.g.dart#L5-L260)

- [`assets/translations/en.json`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/assets/translations/en.json)

- [`assets/translations/ar.json`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/assets/translations/ar.json)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L20-L28)

- [`lib/core/utils/app_strater.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/app_strater.dart#L37-L38)

# Network Layer

The application communicates with backend services through a structured network layer using Dio and Retrofit.

![Network-Layer](https://github.com/user-attachments/assets/93ca4204-ab22-48dc-865d-d2c6f58c8bf4)

Sources:

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L351-L353)

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L363-L407)

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L411-L496)

# Summary

The E-commerce Flower App is a well-structured Flutter application following clean architecture principles. It separates concerns into distinct layers (presentation, domain, data) and uses modern patterns and libraries for state management, dependency injection, and API communication. The app supports multiple languages and provides a comprehensive set of features for browsing and purchasing flower products.

Sources:

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart)

- [`lib/core/utils/app_strater.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/app_strater.dart)

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart)

- [`lib/core/utils/routes/routes.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/routes/routes.dart)

- [`pubspec.yaml`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/pubspec.yaml)

# License

This project is licensed under the Apache 2.0 License – see the <a href="https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/main/LICENSE"> LICENSE </a> file for details.


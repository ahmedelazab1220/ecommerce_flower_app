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

![Application-Architecture](https://github.com/user-attachments/assets/dd6136ad-8864-43e4-8f7c-8a111b8a45db)

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

![App-Initialization-Flow](https://github.com/user-attachments/assets/4dd9f1e0-0394-41fa-927a-655b4b67c932)

Sources:

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L15-L29)

- [`lib/core/utils/app_strater.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/app_strater.dart#L14-L45)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L31-L56)

# Demo Video 

🌸 E-commerce Flower App Demo | Flutter Clean Architecture | Arabic & English Support

[![Demo Video](https://github.com/user-attachments/assets/667013c1-8c3d-4747-9eab-5238c3f7eeb2)](https://www.youtube.com/watch?v=d5HR1Vd2XqQ)

# Key Features and Modules

The application is organized into feature modules, each responsible for a specific functionality. The diagram below shows the main features and their relationships.

![Key-Features-and-Modules](https://github.com/user-attachments/assets/da3010f0-f968-4ffc-94ec-072be487b216)

Sources:

- [`lib/core/utils/routes/routes.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/routes/routes.dart#L27-L107)

- [`lib/core/utils/l10n/locale_keys.g.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/l10n/locale_keys.g.dart#L5-L260)

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L300-L799)


# State Management Pattern

The application uses the BLoC/Cubit pattern for state management, providing a unidirectional data flow that makes the app's state predictable and maintainable.

![State-Management-Pattern](https://github.com/user-attachments/assets/29023607-62ca-4181-b087-2670d1886c49)

Sources:

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L580-L796)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L19-L19)


# Dependency Injection System

The application uses GetIt and the Injectable package for dependency injection, allowing for loose coupling between components and easier testing.

![Dependency-Injection-System](https://github.com/user-attachments/assets/4982296f-4740-4d03-9fc3-d20d2b742c7d)

Sources:

- [`lib/core/utils/di/di.config.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/di/di.config.dart#L300-L799)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L12-L12)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L19-L19)

# Localization System

The application supports multiple languages (English and Arabic) through easy_localization, allowing for seamless language switching.

![Localization-System](https://github.com/user-attachments/assets/1e693706-3bf1-4a3b-8b80-221a7b5da7a1)

Sources:

- [`lib/core/utils/l10n/locale_keys.g.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/l10n/locale_keys.g.dart#L5-L260)

- [`assets/translations/en.json`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/assets/translations/en.json)

- [`assets/translations/ar.json`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/assets/translations/ar.json)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L20-L28)

- [`lib/core/utils/app_strater.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/app_strater.dart#L37-L38)

# Navigation System

The application uses Flutter's navigation system with named routes, providing a structured way to navigate between screens.

![Navigation-System](https://github.com/user-attachments/assets/b0c40b98-bd6e-415a-a179-10a91151e8e3)

Sources:

- [`lib/core/utils/routes/routes.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/core/utils/routes/routes.dart#L27-L107)

- [`lib/main.dart`](https://github.com/ahmedelazab1220/ecommerce_flower_app/blob/c08d0e33/lib/main.dart#L32-L56)


# Network Layer

The application communicates with backend services through a structured network layer using Dio and Retrofit.

![Network-Layer](https://github.com/user-attachments/assets/72e992f9-ce25-45e4-ab78-8f28c1be340d)

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


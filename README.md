# 🎬 Movies App (Flutter)

A Flutter-based movie application built to demonstrate modern Flutter architecture, clean code practices, and scalable app structure.  
This project is intended for learning, experimentation, and portfolio purposes.

---

## 📱 Features

- Browse movie data from remote API
- Clean and modular architecture
- State management using BLoC
- Dependency Injection with GetIt & Injectable
- Environment-based configuration (dev & prod)
- Localization support (i18n)
- Error tracking with Firebase Crashlytics
- Modern navigation using GoRouter

---

## 🏗️ Architecture

This project follows **Clean Architecture principles** with clear separation of concerns:

- **Presentation**: UI & BLoC
- **Domain**: Business logic & entities
- **Data**: Remote data sources, models, repositories

State management is handled using **BLoC**, ensuring predictable and testable state flow.

---

## 🧰 Tech Stack

### Core
- **Flutter** (SDK ^3.9.2)
- **Dart**

### State Management
- `bloc`
- `flutter_bloc`

### Dependency Injection
- `get_it`
- `injectable`

### Networking
- `dio`

### Navigation
- `go_router`

### Localization
- `flutter_localizations`
- `intl`

### Firebase
- `firebase_core`
- `firebase_crashlytics`

### Utilities
- `equatable`
- `flutter_dotenv`
- `cached_network_image`
- `url_launcher`

### Testing
- `bloc_test`
- `mocktail`
- `network_image_mock`

### Code Generation
- `build_runner`
- `injectable_generator`
- `intl_utils`

---

## ⚙️ Environment Configuration

This project uses environment files:

```bash
.env.dev
.env.prod
```

---

## 📷 Screenshots

<img width="1024" height="1536" alt="ChatGPT Image Jan 16, 2026, 09_08_50 PM" src="https://github.com/user-attachments/assets/e10a9d7d-1ec8-427d-8bec-f77574803ef0" />



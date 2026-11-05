# Flutter BLoC Counter App

A simple Counter application built with Flutter to understand the fundamentals of BLoC architecture and event-driven programming.

## Overview

This project demonstrates how to separate business logic from UI rendering using the `flutter_bloc` package.

## Features

- Increment counter value.
- Decrement counter value.
- Reset counter value to zero.
- Manage application state using BLoC.

## Concepts Covered

- BLoC Architecture
- Event-Driven Programming
- Unidirectional Data Flow
- Events and States
- `BlocProvider`
- `BlocBuilder`
- Event Handlers using `on<Event>()`
- Accessing BLoC using `context.read()`

## Project Structure

```text
lib/
├── main.dart
├── counter_event.dart
├── counter_state.dart
└── counter_bloc.dart
```

## Dependencies

- Flutter
- Dart
- flutter_bloc: ^8.0.1

## Getting Started

1. Clone the repository:

```bash
git clone <repository-url>
```

2. Navigate to the project directory:

```bash
cd flutter_bloc_course
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Learning Objective

The main goal of this project is to understand how BLoC handles events, manages states, and updates the UI without using `setState()` in the presentation layer.

---

**Status:** Completed

# Movie App built by flutter❤️ 

![Movie App](https://github.com/Halawany1/Movie-App/assets/96886506/604577db-7f40-4cb4-b6a9-848c54cd0ed6)

#### [Video](https://www.linkedin.com/posts/mohamed-elhalawany-329314220_movie-flutter-dart-activity-7108075317000323072-Q0lK?utm_source=share&utm_medium=member_desktop)

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
4. [Project Structure](#project-structure)
5. [Usage](#usage)
6. [Dependencies](#dependencies)

## Overview

Welcome to the Movie App repository! This Flutter application is built with a clean architecture, incorporating distinct layers for data, domain, and presentation. The architecture ensures a modular and maintainable codebase, fostering separation of concerns and scalability. Let's dive into the key features and architectural components of the Movie App.

## Features

- **clean architecture:**  incorporating distinct layers for data, domain, and presentation.
  
- **API Handling:** Utilizes Dio for seamless handling of API requests, supporting GET and POST operations to interact with TMDB API.

- **Authentication:** Implements user authentication functionalities such as login and signup with validation.

- **Professionally Shared Preferences:** Securely stores user data and preferences using shared preferences, ensuring a professional and reliable data storage solution.

- **Splash Screen Animation:** Engages users with an animated splash screen for a visually appealing start to the app.

- **Loading Animation:** Enhances user experience with loading animations during data retrieval or processing.

- **State Management (Cubit):** Adopts the Cubit pattern for efficient state management, ensuring a scalable and organized application architecture.

- **Google Fonts:** Integrates custom fonts using the `google_fonts` package for enhanced typographic design.

- **Gradients Color:** Enhances visual aesthetics with gradient colors for a modern and dynamic user interface.

- **TMDB API Integration:** Leverages TMDB API for fetching movie-related data, ensuring a rich and up-to-date content experience.

## Getting Started

### Prerequisites

- Ensure you have Flutter and Dart installed on your development machine. For installation instructions, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/YourUsername/Movie_App.git
1. Navigate to the project directory:
    ```bash
   cd Movie_App.git
2. Install dependencies:
    ```bash
   flutter pub get

## Project Structure

- # Data Layer:

- **Repositories:** Interfaces for data sources (local and remote) are defined here.
- **Data Sources:** Implementations of data sources, such as API calls and local storage, reside in this layer.
- **Model:** Represents the properties of a movie and includes methods for converting to and from JSON, which is a common requirement when working with APIs.

- # Domain Layer:

- **Use Cases:** Business logic is encapsulated in use cases, acting as intermediaries between the presentation layer and data layer.
- **Entities:** Core business entities, representing the main data models of the application, are defined here.
- **Repositories:** Abstract repository interfaces, connecting the domain layer to the data layer, are specified here.

- # Presentation Layer:

- **Cubit:** The Cubit pattern is employed for state management, promoting a reactive and predictable application state.
- **Screens and Widgets:** The UI components, screens, and widgets are designed based on the state emitted by Cubits.


  
## Usage
- To run the app on an emulator or physical device, use the following command:
   ```bash
   flutter run

## Dependencies

The Movie App relies on the following key dependencies, each serving a specific purpose:

![image](https://github.com/Halawany1/Movie-App/assets/96886506/b7274b05-0646-4181-a544-c3920b65f1c8)


For a complete list of dependencies, refer to the `pubspec.yaml` file.

## Feedback

If you have any feedback, please reach out to us at mohamedelhalawany120@gmail.com

## 🔗 You can follow me on

[![portfolio](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/halawany1)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mohamed-elhalawany-329314220/)


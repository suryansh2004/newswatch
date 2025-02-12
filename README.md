# NewsWatch

NewsWatch is a Flutter-based news application that provides users with the latest news updates from various sources. The app integrates Firebase for authentication and an external news API for fetching articles.

## Features

- **User Authentication**: Supports user login/signup using Firebase Authentication (Google, Email & Password).
- **Latest News Updates**: Fetches and displays news articles from an external API.
- **Categorized News**: Users can browse news articles by category.
- **User Profile**: A profile section where users can manage their settings.
- **Responsive UI**: Optimized for both Android and iOS.

## Tech Stack

- **Flutter** (Dart)
- **Firebase** (Authentication, Firestore, Firebase Core)
- **GetX** (State Management & Navigation)
- **REST API** (For fetching news data)
- **Material Design** (For UI components)

## Project Structure

```
├── Widgets
│   ├── bottom_navigator.dart
│   ├── news_card_widget.dart
├── model
│   ├── article_model.dart
│   ├── source_model.dart
├── screens
│   ├── auth_screen.dart
│   ├── custom_listile.dart
│   ├── home.dart
│   ├── news_details.dart
│   ├── post.dart
│   ├── profile.dart
│   ├── settings.dart
│   ├── signin.dart
│   ├── signup.dart
│   ├── splash.dart
│   ├── verify.dart
│   ├── welcome_screen.dart
├── services
│   ├── api_services.dart
│   ├── auth_aservices.dart
│   ├── auth_fservices.dart
│   ├── auth_gservices.dart
│   ├── firebase_options.dart
├── main.dart
```

## Setup & Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/newswatch.git
   cd newswatch
   ```

2. **Install dependencies**
   ```sh
   flutter pub get
   ```

3. **Set up Firebase**
   - Create a Firebase project.
   - Enable Firebase Authentication.
   - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place them in the respective directories.

4. **Run the application**
   ```sh
   flutter run
   ```

## Contributing

Contributions are welcome! Feel free to fork the repository and submit a pull request.

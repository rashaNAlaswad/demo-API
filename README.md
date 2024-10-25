# Flutter dealing with API

## Overview
The Demo API app allows users to sign in, sign up, and manage their profiles. This project uses the famous request API (GET, PUT, PATCH, and DELETE) to perform CRUD (Create, Read, Update, and Delete) operations.

## Features
- **Sign In**: Users can sign in with their email and password.
- **Sign Up**: Users can create an account by filling in a registration form with their name, phone number, email, password, and confirming their password. They must also upload a profile image from their gallery.
- **Profile Management**: Users can view their profile information, including their uploaded image, name, phone number, and email.
- **Edit Profile**: Users can edit their profile information, including uploading a new image and changing their name and phone number.
- **Delete Account**: Users can delete their account, which will remove their profile information from the database.
- **Token-based Authentication**: The app uses token-based authentication to authenticate users. The token is stored in shared preferences, allowing users to remain logged in even after closing the app.

## Dependencies
This project uses the following dependencies:

- [dartz](https://pub.dev/packages/dartz): Functional programming library for Dart
- [dio](https://pub.dev/packages/dio): HTTP client library for Dart
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): State management library for Flutter
- [get_it](https://pub.dev/packages/get_it): Dependency injection library for Dart
- [image_picker](https://pub.dev/packages/image_picker): Library for picking images from the gallery or camera
- [jwt_decoder](https://pub.dev/packages/jwt_decoder): Library for decoding JSON Web Tokens
- [shared_preferences](https://pub.dev/packages/shared_preferences): Library for storing data in shared preferences
- [cached_network_image](https://pub.dev/packages/cached_network_image): Library for caching network images
- [animated_text_kit](https://pub.dev/packages/animated_text_kit): Library for animating text
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil): Library for screen size adaptation
- [google_fonts](https://pub.dev/packages/google_fonts): Library for using Google Fonts

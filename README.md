# No, You Decide

No, You Decide is an iOS application designed for couples and friends to decide upon movies, date nights, and plans. The app uses a Tinder-like interface to help users make decisions together. The project is built using Swift and Firebase.

## Features

- **User Authentication**: 
  - Sign In
  - Sign Up
  - Forgot Password
- **Decision Making**: 
  - Swipe-based interface for choosing movies and plans
- **Firebase Integration**: 
  - User authentication
  - Data storage and retrieval

## Screenshots

*Coming soon*

## Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/no-you-decide.git
    cd no-you-decide
    ```

2. **Open the project**:
    - Open the `No, You Decide.xcodeproj` file in Xcode.

3. **Install dependencies**:
    - Make sure you have CocoaPods installed. If not, install it by running:
      ```bash
      sudo gem install cocoapods
      ```
    - Navigate to the project directory and run:
      ```bash
      pod install
      ```

4. **Firebase Setup**:
    - Go to the [Firebase Console](https://console.firebase.google.com/).
    - Create a new project and add an iOS app to your project.
    - Download the `GoogleService-Info.plist` file and add it to your Xcode project.

5. **Build and Run**:
    - Select your target device or simulator and press `Cmd+R` to build and run the project.

## Usage

- **Sign Up**: Create a new account using your email.
- **Sign In**: Log in with your email and password.
- **Forgot Password**: Reset your password if you forget it.
- **Decision Making**: Swipe through options to decide on movies and plans.

## Project Structure

- `No, You Decide.xcodeproj`: The Xcode project file.
- `No, You Decide/`: Directory containing the source code.
  - `AppDelegate.swift`: The application delegate.
  - `ViewController.swift`: The main view controller.
  - `SignUpViewController.swift`: The sign-up view controller.
  - `SignInViewController.swift`: The sign-in view controller.
  - `ForgotPasswordViewController.swift`: The forgot password view controller.
  - `Main.storyboard`: The main storyboard file.
  - `Assets.xcassets`: Image assets for the app.

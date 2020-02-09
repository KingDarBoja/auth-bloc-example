# Auth Bloc Example

Sample project which illustrates how to setup a Flutter and AngularDart project with code sharing, with authentication and route redirection features.

## Quick Start

_Make sure you have the [Dart SDK](https://dart.dev/tools/sdk) and [Flutter SDK](https://flutter.dev/docs/get-started/install) installed before proceeding._

Open this project in your editor of choice (VSCode is recommended).

### Setup

1. Install dependencies for `core_auth`:

   ```bash
   # change directories into core_auth
   cd core_auth

   # install dependencies
   pub get

   # change directories back out to the root directory
   cd ../
   ```

2. Install dependencies for `flutter_auth`

   ```bash
   # change directories into flutter_auth
   cd flutter_auth

   # install dependencies
   flutter packages get

   # change directories back out to the root directory
   cd ../
   ```

3. Install dependencies for `angular_auth`

   ```bash
   # change directories into angular_auth
   cd angular_auth

   # install dependencies
   pub get

   # change directories back out to the root directory
   cd ../
   ```

### Run Flutter

```bash
# change directories into flutter_auth
cd flutter_auth

# run the flutter project
flutter run
```

### Run AngularDart

```bash

# change directories into angular_auth
cd angular_auth

# run the angular project
webdev serve
```
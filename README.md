# 🧩 Flutter HelpCrunch SDK

A Flutter plugin that provides a simple interface for integrating [HelpCrunch](https://helpcrunch.com) — a modern customer messaging platform — into your Flutter applications.

This package allows you to initialize the HelpCrunch SDK, manage user sessions, customize themes, and open the chat interface directly from your Flutter app.

---

## 🚀 Features

- ✅ Initialize HelpCrunch with your organization credentials  
- 👤 Register and update user information  
- 💬 Send messages programmatically  
- 💡 Display and customize chat UI themes  
- 🔒 Handle user logout and session management  

---

## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_help_crunch: ^1.0.0
````

Then, install it:

```bash
flutter pub get
```

---

## 🤖 Android Setup (Required)

### HelpCrunch depends on libraries distributed through JitPack, so you must add the JitPack repository to your project-level Gradle file.

Open:
android/build.gradle (NOT the one inside app/)

Update the allprojects section:

``` gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url 'https://jitpack.io' } // Required for HelpCrunch
    }
}
```


## 🧰 Usage

### 1️⃣ Import the package

```dart
import 'package:flutter_help_crunch/flutter_help_crunch.dart';
```

---

### 2️⃣ Initialize the SDK

Before showing the chat or sending messages, initialize HelpCrunch with your configuration and user data:

```dart
final helpCrunch = FlutterHelpCrunch();

await helpCrunch.initialize(
  configuration: FHCConfiguration(
    organization: 'your_organization',
    applicationId: 12345,
    applicationSecret: 'your_application_secret',
  ),
  user: FHCUser(
    id: 'user_001',
    name: 'John Doe',
    email: 'john@example.com',
  ),
  theme: FHCTheme(
    primaryColor: 0xFF0066FF,
    chatAreaTheme: FHCChatAreaTheme(
      brandingType: FHCBrandingType.light,
      incomingBubbleColor: 0xFFE0E0E0,
      outcomingBubbleColor: 0xFF0066FF,
    ),
  ),
);
```

---

### 3️⃣ Show the Chat Screen

```dart
final opened = await helpCrunch.showChatScreen();
if (opened) {
  print('HelpCrunch chat opened successfully.');
}
```

---

You can send a message to HelpCrunch directly from code.  
> ⚠️ **Note:** The `isForceNewChat` parameter is **supported on Android only**.  
> On iOS, this flag is ignored and the message is sent in the current chat session.

```dart
await helpCrunch.sendMessage(
  message: 'Hello, I need help with my account.',
  isForceNewChat: false,  // Android only
);
```

---

### 5️⃣ Update User Information

```dart
await helpCrunch.updateUser(
  user: FHCUser(
    id: 'user_001',
    name: 'Jane Doe',
    email: 'jane@example.com',
    phone: '+123456789',
  ),
);
```

---

### 6️⃣ Logout

```dart
await helpCrunch.logout();
```

---

## 🎨 Theming

HelpCrunch allows deep customization of the in-app chat interface.
You can modify the appearance using the following theme components:

* `FHCTheme` – Base container for all themes
* `FHCToolbarAreaTheme` – Controls toolbar colors
* `FHCChatAreaTheme` – Chat bubble colors, text colors, and background
* `FHCMessageAreaTheme` – Input field and message menu styles
* `FHCPreChatTheme` – Styles for pre-chat form
* `FHCAvatarTheme` – Avatar background and text colors

Example:

```dart
final theme = FHCTheme(
  primaryColor: 0xFF4CAF50,
  chatAreaTheme: FHCChatAreaTheme(
    brandingType: FHCBrandingType.dark,
    incomingBubbleColor: 0xFF333333,
    outcomingBubbleColor: 0xFF4CAF50,
    incomingBubbleTextColor: 0xFFFFFFFF,
    outcomingBubbleTextColor: 0xFFFFFFFF,
  ),
);
```

---

## ⚙️ API Overview

| Method             | Description                                                       |
| ------------------ | ----------------------------------------------------------------- |
| `initialize()`     | Initializes the SDK with configuration, user, and optional theme. |
| `showChatScreen()` | Displays the HelpCrunch chat UI.                                  |
| `sendMessage()`    | Sends a message to support.                                       |
| `updateUser()`     | Updates the user information.                                     |
| `logout()`         | Logs out the current user session.                                |

---

## 🧑‍💻 Example Project

You can find a complete example in the [`example/`](example) directory.

---

## 🪪 License

This project is licensed under the **MIT License**.
See the [LICENSE](LICENSE) file for more details.

---

## 💬 Support

If you encounter issues or have questions, please [open an issue](https://github.com/yourusername/flutter_helpcrunch/issues)
or contact the HelpCrunch support team.

---
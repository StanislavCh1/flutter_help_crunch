import 'package:flutter_help_crunch/flutter_help_crunch.dart';
import 'package:flutter_help_crunch/src/flutter_help_crunch_implement.dart';
import 'package:flutter_help_crunch/src/flutter_help_crunch_platform_interface.dart';

export 'src/models/fhc_configuration.dart';

class FlutterHelpCrunch {
  final FlutterHelpCrunchPlatform _platform = FlutterHelpCrunchImplement();

  /// Initializes the HelpCrunch SDK with the given [configuration], [user],
  /// and optional [theme].
  ///
  /// This must be called before using any other HelpCrunch functionality.
  ///
  /// - [configuration]: Contains app and environment setup details.
  /// - [user]: Represents the current user (e.g., id, name, email, etc.).
  /// - [theme]: (Optional) A custom theme to apply to the chat UI.
  ///
  Future<void> initialize(
      {required FHCConfiguration configuration,
      required FHCUser user,
      FHCTheme? theme}) async {
    return _platform.initialize(
        configuration: configuration, user: user, theme: theme);
  }

  /// Logs out the currently authenticated HelpCrunch user.
  ///
  /// After calling this method, the current session will be cleared,
  /// and a new user must be initialized before performing further actions.
  Future<void> logout() async {
    _platform.logout();
  }

  /// Sends a message to HelpCrunch support.
  ///
  /// - [message]: The text content of the message to send.
  /// - [isForceNewChat]: If `true`, starts a new chat instead of reusing
  ///   the existing one. **Supported on Android only.** On iOS, this value
  ///   is ignored and the message is sent in the current chat session.
  ///
  Future<void> sendMessage(
      {required String message, required bool isForceNewChat}) async {
    _platform.sendMessage(message: message, isForceNewChat: isForceNewChat);
  }

  /// Displays the HelpCrunch chat screen.
  ///
  /// Returns `true` if the chat screen was successfully opened, otherwise `false`.
  ///
  /// Use this to allow users to view and interact with support conversations.
  Future<bool> showChatScreen() async {
    return await _platform.showChatScreen();
  }

  /// Updates the user information in the HelpCrunch system.
  ///
  /// Use this to refresh user data (e.g., after profile updates).
  ///
  /// - [user]: The updated user information.
  Future<void> updateUser({required FHCUser user}) async {
    _platform.updateUser(user: user);
  }
}

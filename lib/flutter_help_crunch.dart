import 'package:flutter_help_crunch/flutter_help_crunch.dart';
import 'package:flutter_help_crunch/src/flutter_help_crunch_implement.dart';
import 'package:flutter_help_crunch/src/flutter_help_crunch_platform_interface.dart';

export 'src/models/fhc_configuration.dart';

class FlutterHelpCrunch {
  final FlutterHelpCrunchPlatform _platform = FlutterHelpCrunchImplement();

  Future<void> initialize(
      {required FHCConfiguration configuration,
      required FHCUser user,
      FHCTheme? theme}) async {
    return _platform.initialize(
        configuration: configuration, user: user, theme: theme);
  }

  Future<void> logout() async {
    _platform.logout();
  }

  Future<void> sendMessage(
      {required String message, required bool isForceNewChat}) async {
    _platform.sendMessage(message: message, isForceNewChat: isForceNewChat);
  }

  Future<bool> showChatScreen() async {
    return await _platform.showChatScreen();
  }

  Future<void> updateUser({required FHCUser user}) async {
    _platform.updateUser(user: user);
  }
}

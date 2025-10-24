import 'package:flutter_help_crunch/src/flutter_help_crunch_platform_interface.dart';
import 'package:flutter_help_crunch/src/messages.g.dart';
import 'package:flutter_help_crunch/src/models/fhc_configuration.dart';

class FlutterHelpCrunchImplement implements FlutterHelpCrunchPlatform {
  final FlutterHelpCrunchApi _api = FlutterHelpCrunchApi();
  @override
  Future<void> initialize(
      {required FHCConfiguration configuration,
      required FHCUser user,
      FHCTheme? theme}) async {
    _api.initialize(
        configuration: configuration.toMessage(),
        user: user.toMessage(),
        theme: theme?.toMessage());
  }

  @override
  Future<void> logout() async {
    _api.logout();
  }

  @override
  Future<void> sendMessage(
      {required String message, required bool isForceNewChat}) async {
    _api.sendMessage(message: message, isForceNewChat: isForceNewChat);
  }

  @override
  Future<bool> showChatScreen() async {
    return await _api.showChatScreen();
  }

  @override
  Future<void> updateUser({required FHCUser user}) async {
    _api.updateUser(user: user.toMessage());
  }
}

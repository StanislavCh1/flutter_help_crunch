import 'package:flutter_help_crunch/flutter_help_crunch.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class FlutterHelpCrunchPlatform extends PlatformInterface {
  /// Constructs a FlutterHelpCrunchPlatform.
  FlutterHelpCrunchPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterHelpCrunchPlatform _instance =
      _FlutterHelpCrunchPlatformImplementation();

  /// The default instance of [FlutterHelpCrunchPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterHelpCrunch].
  static FlutterHelpCrunchPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterHelpCrunchPlatform] when
  /// they register themselves.
  static set instance(FlutterHelpCrunchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(
      {required FHCConfiguration configuration,
      required FHCUser user,
      FHCTheme? theme}) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> updateUser({required FHCUser user}) {
    throw UnimplementedError('updateUser() has not been implemented.');
  }

  Future<bool> showChatScreen() {
    throw UnimplementedError('showChatScreen() has not been implemented.');
  }

  Future<void> sendMessage(
      {required String message, required bool isForceNewChat}) {
    throw UnimplementedError('sendMessage() has not been implemented.');
  }

  Future<void> logout() {
    throw UnimplementedError('logout() has not been implemented.');
  }
}

class _FlutterHelpCrunchPlatformImplementation
    extends FlutterHelpCrunchPlatform {}

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
    dartOut: "lib/src/messages.g.dart",
    kotlinOut:
        "android/src/main/kotlin/com/fhc/flutter_help_crunch/FlutterMessage.kt",
    swiftOut: "ios/Classes/FlutterMessage.swift"))
@HostApi()
abstract class FlutterHelpCrunchApi {
  void initialize(
      {required ConfigurationMessage configuration,
      required UserMessage user,
      ThemeMessage? theme});

  void updateUser({required UserMessage user});

  bool showChatScreen();

  void sendMessage({required String message, required bool isForceNewChat});

  void logout();
}

//-----------------------------

class ConfigurationMessage {
  final String organization;
  final String applicationId;
  final String applicationSecret;
  ConfigurationMessage({
    required this.organization,
    required this.applicationId,
    required this.applicationSecret,
  });
}

class UserMessage {
  final String id;
  final String? name;
  final String? email;
  final String? phone;

  UserMessage({required this.id, this.name, this.email, this.phone});
}

enum BrandingTypeMessage { light, dark }

class AvatarThemeMessage {
  final bool useDefaultAvatarColors;
  final String? placeholderBackgroundColorHex;
  final String? placeholderTextColorHex;

  AvatarThemeMessage({
    this.useDefaultAvatarColors = true,
    this.placeholderBackgroundColorHex,
    this.placeholderTextColorHex,
  });
}

// ---------------------------------------------------------------

class MessageAreaThemeMessage {
  final String? backgroundColorHex;
  final String? inputOutlineColorHex;
  final String? inputFieldTextColorHex;
  final String? inputFieldTextHintColorHex;
  final String? messageMenuBackgroundColorHex;
  final String? messageMenuTextColorHex;
  final String? messageMenuSummaryTextColorHex;
  final String? messageMenuIconColorHex;

  MessageAreaThemeMessage({
    this.backgroundColorHex,
    this.inputOutlineColorHex,
    this.inputFieldTextColorHex,
    this.inputFieldTextHintColorHex,
    this.messageMenuBackgroundColorHex,
    this.messageMenuTextColorHex,
    this.messageMenuSummaryTextColorHex,
    this.messageMenuIconColorHex,
  });
}
// ---------------------------------------------------------------

class ChatAreaThemeMessage {
  final String? incomingBubbleTextColorHex;
  final String? outcomingBubbleTextColorHex;
  final String? incomingBubbleColorHex;
  final String? outcomingBubbleColorHex;
  final String? backgroundColorHex;
  final BrandingTypeMessage brandingType;

  ChatAreaThemeMessage({
    this.incomingBubbleTextColorHex,
    this.outcomingBubbleTextColorHex,
    this.incomingBubbleColorHex,
    this.outcomingBubbleColorHex,
    this.backgroundColorHex,
    this.brandingType = BrandingTypeMessage.light,
  });
}

// ------------------ SYSTEM ALERTS THEME ------------------
class SystemAlertsThemeMessage {
  final String? dialogsHeaderColorHex;
  final String? toastsBackgroundColorHex;
  final String? toastsTextColorHex;
  final String? welcomeMessageBackgroundColorHex;
  final String? welcomeMessageTextColorHex;
  final String? warningDialogsHeaderColorHex;

  const SystemAlertsThemeMessage({
    this.dialogsHeaderColorHex,
    this.toastsBackgroundColorHex,
    this.toastsTextColorHex,
    this.welcomeMessageBackgroundColorHex,
    this.welcomeMessageTextColorHex,
    this.warningDialogsHeaderColorHex,
  });
}

// ------------------ PRECHAT THEME ------------------
class PreChatThemeMessage {
  final String? inputFieldTextColorHex;
  final String? inputFieldTextHintColorHex;
  final String? backgroundColorHex;
  final String? messageBackgroundColorHex;
  final String? messageTextColorHex;

  const PreChatThemeMessage({
    this.inputFieldTextColorHex,
    this.inputFieldTextHintColorHex,
    this.backgroundColorHex,
    this.messageBackgroundColorHex,
    this.messageTextColorHex,
  });
}

// ------------------ TOOLBAR AREA THEME ------------------
class ToolbarAreaThemeMessage {
  final String? backgroundColorHex;
  final String? statusBarColorHex;
  final String? outlineColorHex;
  final String? agentsTextColorHex;
  final AvatarThemeMessage? avatarTheme;

  const ToolbarAreaThemeMessage({
    this.backgroundColorHex,
    this.statusBarColorHex,
    this.outlineColorHex,
    this.agentsTextColorHex,
    this.avatarTheme,
  });
}

class ThemeMessage {
  final String? primaryColorHex;
  final ToolbarAreaThemeMessage? toolbarAreaTheme;
  final ChatAreaThemeMessage? chatAreaTheme;
  final MessageAreaThemeMessage? messageAreaTheme;
  final PreChatThemeMessage? preChatTheme;
  final SystemAlertsThemeMessage? systemAlertsTheme;
  final AvatarThemeMessage? avatarTheme;
  const ThemeMessage({
    this.primaryColorHex,
    this.toolbarAreaTheme,
    this.chatAreaTheme,
    this.messageAreaTheme,
    this.preChatTheme,
    this.systemAlertsTheme,
    this.avatarTheme,
  });
}

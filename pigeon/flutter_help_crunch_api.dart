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
  final int applicationId;
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
  final int? placeholderBackgroundColor;
  final int? placeholderTextColor;

  AvatarThemeMessage({
    this.useDefaultAvatarColors = true,
    this.placeholderBackgroundColor,
    this.placeholderTextColor,
  });
}

// ---------------------------------------------------------------

class MessageAreaThemeMessage {
  final int? backgroundColor;
  final int? inputOutlineColor;
  final int? inputFieldTextColor;
  final int? inputFieldTextHintColor;
  final int? messageMenuBackgroundColor;
  final int? messageMenuTextColor;
  final int? messageMenuSummaryTextColor;
  final int? messageMenuIconColor;

  MessageAreaThemeMessage({
    this.backgroundColor,
    this.inputOutlineColor,
    this.inputFieldTextColor,
    this.inputFieldTextHintColor,
    this.messageMenuBackgroundColor,
    this.messageMenuTextColor,
    this.messageMenuSummaryTextColor,
    this.messageMenuIconColor,
  });
}
// ---------------------------------------------------------------

class ChatAreaThemeMessage {
  final int? incomingBubbleTextColor;
  final int? outcomingBubbleTextColor;
  final int? incomingBubbleColor;
  final int? outcomingBubbleColor;
  final int? backgroundColor;
  final BrandingTypeMessage brandingType;
  final int? incomingCodeBackgroundColor;
  final int? outcomingCodeBackgroundColor;
  final int? incomingCodeTextColor;
  final int? outcomingCodeTextColor;
  final int? incomingBlockQuoteColor;
  final int? outcomingBlockQuoteColor;
  final int? incomingFileTextColor;
  final int? outcomingFileTextColor;
  final int? authorNameColor;
  final int? systemMessageColor;
  final int? timeTextColor;
  final int? progressViewsColor;
  final int? chatBackgroundColor;
  ChatAreaThemeMessage({
    this.incomingBubbleTextColor,
    this.outcomingBubbleTextColor,
    this.incomingBubbleColor,
    this.outcomingBubbleColor,
    this.backgroundColor,
    this.brandingType = BrandingTypeMessage.light,
    this.incomingCodeBackgroundColor,
    this.outcomingCodeBackgroundColor,
    this.incomingCodeTextColor,
    this.outcomingCodeTextColor,
    this.incomingBlockQuoteColor,
    this.outcomingBlockQuoteColor,
    this.incomingFileTextColor,
    this.outcomingFileTextColor,
    this.authorNameColor,
    this.systemMessageColor,
    this.timeTextColor,
    this.progressViewsColor,
    this.chatBackgroundColor,
  });
}

// ------------------ PRECHAT THEME ------------------
class PreChatThemeMessage {
  final int? inputFieldTextColor;
  final int? inputFieldTextHintColor;
  final int? backgroundColor;
  final int? messageBackgroundColor;
  final int? messageTextColor;

  const PreChatThemeMessage({
    this.inputFieldTextColor,
    this.inputFieldTextHintColor,
    this.backgroundColor,
    this.messageBackgroundColor,
    this.messageTextColor,
  });
}

// ------------------ TOOLBAR AREA THEME ------------------
class ToolbarAreaThemeMessage {
  final int? backgroundColor;
  final int? statusBarColor;
  final int? outlineColor;
  final int? agentsTextColor;

  const ToolbarAreaThemeMessage({
    this.backgroundColor,
    this.statusBarColor,
    this.outlineColor,
    this.agentsTextColor,
  });
}

class ThemeMessage {
  final int? primaryColor;
  final ToolbarAreaThemeMessage? toolbarAreaTheme;
  final ChatAreaThemeMessage? chatAreaTheme;
  final MessageAreaThemeMessage? messageAreaTheme;
  final PreChatThemeMessage? preChatTheme;
  final AvatarThemeMessage? avatarTheme;
  const ThemeMessage({
    this.primaryColor,
    this.toolbarAreaTheme,
    this.chatAreaTheme,
    this.messageAreaTheme,
    this.preChatTheme,
    this.avatarTheme,
  });
}

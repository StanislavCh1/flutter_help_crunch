//-----------------------------

import 'package:flutter_help_crunch/src/messages.g.dart';

class FHCConfiguration {
  final String organization;
  final int applicationId;
  final String applicationSecret;
  FHCConfiguration({
    required this.organization,
    required this.applicationId,
    required this.applicationSecret,
  });

  ConfigurationMessage toMessage() {
    return ConfigurationMessage(
      organization: organization,
      applicationId: applicationId,
      applicationSecret: applicationSecret,
    );
  }
}

class FHCUser {
  final String id;
  final String? name;
  final String? email;
  final String? phone;

  FHCUser({required this.id, this.name, this.email, this.phone});

  UserMessage toMessage() {
    return UserMessage(
      id: id,
      name: name,
      email: email,
      phone: phone,
    );
  }
}

enum FHCBrandingType { light, dark }

class FHCAvatarTheme {
  final bool useDefaultAvatarColors;
  final int? placeholderBackgroundColor;
  final int? placeholderTextColor;

  FHCAvatarTheme({
    this.useDefaultAvatarColors = true,
    this.placeholderBackgroundColor,
    this.placeholderTextColor,
  });

  AvatarThemeMessage toMessage() {
    return AvatarThemeMessage(
      useDefaultAvatarColors: useDefaultAvatarColors,
      placeholderBackgroundColor: placeholderBackgroundColor,
      placeholderTextColor: placeholderTextColor,
    );
  }
}

// ---------------------------------------------------------------

class FHCMessageAreaTheme {
  final int? backgroundColor;
  final int? inputOutlineColor;
  final int? inputFieldTextColor;
  final int? inputFieldTextHintColor;
  final int? messageMenuBackgroundColor;
  final int? messageMenuTextColor;
  final int? messageMenuSummaryTextColor;
  final int? messageMenuIconColor;

  FHCMessageAreaTheme({
    this.backgroundColor,
    this.inputOutlineColor,
    this.inputFieldTextColor,
    this.inputFieldTextHintColor,
    this.messageMenuBackgroundColor,
    this.messageMenuTextColor,
    this.messageMenuSummaryTextColor,
    this.messageMenuIconColor,
  });

  MessageAreaThemeMessage toMessage() {
    return MessageAreaThemeMessage(
      backgroundColor: backgroundColor,
      inputOutlineColor: inputOutlineColor,
      inputFieldTextColor: inputFieldTextColor,
      inputFieldTextHintColor: inputFieldTextHintColor,
      messageMenuBackgroundColor: messageMenuBackgroundColor,
      messageMenuTextColor: messageMenuTextColor,
      messageMenuSummaryTextColor: messageMenuSummaryTextColor,
      messageMenuIconColor: messageMenuIconColor,
    );
  }
}
// ---------------------------------------------------------------

class FHCChatAreaTheme {
  final int? incomingBubbleTextColor;
  final int? outcomingBubbleTextColor;
  final int? incomingBubbleColor;
  final int? outcomingBubbleColor;
  final int? backgroundColor;
  final FHCBrandingType brandingType;
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
  FHCChatAreaTheme({
    this.incomingBubbleTextColor,
    this.outcomingBubbleTextColor,
    this.incomingBubbleColor,
    this.outcomingBubbleColor,
    this.backgroundColor,
    this.brandingType = FHCBrandingType.light,
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

  ChatAreaThemeMessage toMessage() {
    return ChatAreaThemeMessage(
      incomingBubbleTextColor: incomingBubbleTextColor,
      outcomingBubbleTextColor: outcomingBubbleTextColor,
      incomingBubbleColor: incomingBubbleColor,
      outcomingBubbleColor: outcomingBubbleColor,
      backgroundColor: backgroundColor,
      brandingType: brandingType == FHCBrandingType.light
          ? BrandingTypeMessage.light
          : BrandingTypeMessage.dark,
      incomingCodeBackgroundColor: incomingCodeBackgroundColor,
      outcomingCodeBackgroundColor: outcomingCodeBackgroundColor,
      incomingCodeTextColor: incomingCodeTextColor,
      outcomingCodeTextColor: outcomingCodeTextColor,
      incomingBlockQuoteColor: incomingBlockQuoteColor,
      outcomingBlockQuoteColor: outcomingBlockQuoteColor,
      incomingFileTextColor: incomingFileTextColor,
      outcomingFileTextColor: outcomingFileTextColor,
      authorNameColor: authorNameColor,
      systemMessageColor: systemMessageColor,
      timeTextColor: timeTextColor,
      progressViewsColor: progressViewsColor,
      chatBackgroundColor: chatBackgroundColor,
    );
  }
}

// ------------------ PRECHAT THEME ------------------
class FHCPreChatTheme {
  final int? inputFieldTextColor;
  final int? inputFieldTextHintColor;
  final int? backgroundColor;
  final int? messageBackgroundColor;
  final int? messageTextColor;

  const FHCPreChatTheme({
    this.inputFieldTextColor,
    this.inputFieldTextHintColor,
    this.backgroundColor,
    this.messageBackgroundColor,
    this.messageTextColor,
  });

  PreChatThemeMessage toMessage() {
    return PreChatThemeMessage(
      inputFieldTextColor: inputFieldTextColor,
      inputFieldTextHintColor: inputFieldTextHintColor,
      backgroundColor: backgroundColor,
      messageBackgroundColor: messageBackgroundColor,
      messageTextColor: messageTextColor,
    );
  }
}

// ------------------ TOOLBAR AREA THEME ------------------
class FHCToolbarAreaTheme {
  final int? backgroundColor;
  final int? statusBarColor;
  final int? outlineColor;
  final int? agentsTextColor;

  const FHCToolbarAreaTheme({
    this.backgroundColor,
    this.statusBarColor,
    this.outlineColor,
    this.agentsTextColor,
  });

  ToolbarAreaThemeMessage toMessage() {
    return ToolbarAreaThemeMessage(
      backgroundColor: backgroundColor,
      statusBarColor: statusBarColor,
      outlineColor: outlineColor,
      agentsTextColor: agentsTextColor,
    );
  }
}

class FHCTheme {
  final int primaryColor;
  final FHCToolbarAreaTheme? toolbarAreaTheme;
  final FHCChatAreaTheme? chatAreaTheme;
  final FHCMessageAreaTheme? messageAreaTheme;
  final FHCPreChatTheme? preChatTheme;
  final FHCAvatarTheme? avatarTheme;
  const FHCTheme({
    required this.primaryColor,
    this.toolbarAreaTheme,
    this.chatAreaTheme,
    this.messageAreaTheme,
    this.preChatTheme,
    this.avatarTheme,
  });

  ThemeMessage toMessage() {
    return ThemeMessage(
      primaryColor: primaryColor,
      toolbarAreaTheme: toolbarAreaTheme?.toMessage(),
      chatAreaTheme: chatAreaTheme?.toMessage(),
      messageAreaTheme: messageAreaTheme?.toMessage(),
      preChatTheme: preChatTheme?.toMessage(),
    );
  }
}

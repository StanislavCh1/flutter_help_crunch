//-----------------------------

import 'package:flutter_help_crunch/src/messages.g.dart';

class FHCConfiguration {
  final String organization;
  final String applicationId;
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
  final String? placeholderBackgroundColorHex;
  final String? placeholderTextColorHex;

  FHCAvatarTheme({
    this.useDefaultAvatarColors = true,
    this.placeholderBackgroundColorHex,
    this.placeholderTextColorHex,
  });

  AvatarThemeMessage toMessage() {
    return AvatarThemeMessage(
      useDefaultAvatarColors: useDefaultAvatarColors,
      placeholderBackgroundColorHex: placeholderBackgroundColorHex,
      placeholderTextColorHex: placeholderTextColorHex,
    );
  }
}

// ---------------------------------------------------------------

class FHCMessageAreaTheme {
  final String? backgroundColorHex;
  final String? inputOutlineColorHex;
  final String? inputFieldTextColorHex;
  final String? inputFieldTextHintColorHex;
  final String? messageMenuBackgroundColorHex;
  final String? messageMenuTextColorHex;
  final String? messageMenuSummaryTextColorHex;
  final String? messageMenuIconColorHex;

  FHCMessageAreaTheme({
    this.backgroundColorHex,
    this.inputOutlineColorHex,
    this.inputFieldTextColorHex,
    this.inputFieldTextHintColorHex,
    this.messageMenuBackgroundColorHex,
    this.messageMenuTextColorHex,
    this.messageMenuSummaryTextColorHex,
    this.messageMenuIconColorHex,
  });

  MessageAreaThemeMessage toMessage() {
    return MessageAreaThemeMessage(
      backgroundColorHex: backgroundColorHex,
      inputOutlineColorHex: inputOutlineColorHex,
      inputFieldTextColorHex: inputFieldTextColorHex,
      inputFieldTextHintColorHex: inputFieldTextHintColorHex,
      messageMenuBackgroundColorHex: messageMenuBackgroundColorHex,
      messageMenuTextColorHex: messageMenuTextColorHex,
      messageMenuSummaryTextColorHex: messageMenuSummaryTextColorHex,
      messageMenuIconColorHex: messageMenuIconColorHex,
    );
  }
}
// ---------------------------------------------------------------

class FHCChatAreaTheme {
  final String? incomingBubbleTextColorHex;
  final String? outcomingBubbleTextColorHex;
  final String? incomingBubbleColorHex;
  final String? outcomingBubbleColorHex;
  final String? backgroundColorHex;
  final FHCBrandingType brandingType;
  final FHCAvatarTheme? avatarTheme;

  FHCChatAreaTheme({
    this.incomingBubbleTextColorHex,
    this.outcomingBubbleTextColorHex,
    this.incomingBubbleColorHex,
    this.outcomingBubbleColorHex,
    this.backgroundColorHex,
    this.brandingType = FHCBrandingType.light,
    this.avatarTheme,
  });

  ChatAreaThemeMessage toMessage() {
    return ChatAreaThemeMessage(
      incomingBubbleTextColorHex: incomingBubbleTextColorHex,
      outcomingBubbleTextColorHex: outcomingBubbleTextColorHex,
      incomingBubbleColorHex: incomingBubbleColorHex,
      outcomingBubbleColorHex: outcomingBubbleColorHex,
      backgroundColorHex: backgroundColorHex,
      brandingType: brandingType == FHCBrandingType.light
          ? BrandingType.light
          : BrandingType.dark,
      avatarTheme: avatarTheme?.toMessage(),
    );
  }
}

// ------------------ SYSTEM ALERTS THEME ------------------
class FHCSystemAlertsTheme {
  final String? dialogsHeaderColorHex;
  final String? toastsBackgroundColorHex;
  final String? toastsTextColorHex;
  final String? welcomeMessageBackgroundColorHex;
  final String? welcomeMessageTextColorHex;
  final String? warningDialogsHeaderColorHex;

  const FHCSystemAlertsTheme({
    this.dialogsHeaderColorHex,
    this.toastsBackgroundColorHex,
    this.toastsTextColorHex,
    this.welcomeMessageBackgroundColorHex,
    this.welcomeMessageTextColorHex,
    this.warningDialogsHeaderColorHex,
  });

  SystemAlertsThemeMessage toMessage() {
    return SystemAlertsThemeMessage(
      dialogsHeaderColorHex: dialogsHeaderColorHex,
      toastsBackgroundColorHex: toastsBackgroundColorHex,
      toastsTextColorHex: toastsTextColorHex,
      welcomeMessageBackgroundColorHex: welcomeMessageBackgroundColorHex,
      welcomeMessageTextColorHex: welcomeMessageTextColorHex,
      warningDialogsHeaderColorHex: warningDialogsHeaderColorHex,
    );
  }
}

// ------------------ PRECHAT THEME ------------------
class FHCPreChatTheme {
  final String? inputFieldTextColorHex;
  final String? inputFieldTextHintColorHex;
  final String? backgroundColorHex;
  final String? messageBackgroundColorHex;
  final String? messageTextColorHex;

  const FHCPreChatTheme({
    this.inputFieldTextColorHex,
    this.inputFieldTextHintColorHex,
    this.backgroundColorHex,
    this.messageBackgroundColorHex,
    this.messageTextColorHex,
  });

  PreChatThemeMessage toMessage() {
    return PreChatThemeMessage(
      inputFieldTextColorHex: inputFieldTextColorHex,
      inputFieldTextHintColorHex: inputFieldTextHintColorHex,
      backgroundColorHex: backgroundColorHex,
      messageBackgroundColorHex: messageBackgroundColorHex,
      messageTextColorHex: messageTextColorHex,
    );
  }
}

// ------------------ TOOLBAR AREA THEME ------------------
class FHCToolbarAreaTheme {
  final String? backgroundColorHex;
  final String? statusBarColorHex;
  final String? outlineColorHex;
  final String? agentsTextColorHex;
  final FHCAvatarTheme? avatarTheme;

  const FHCToolbarAreaTheme({
    this.backgroundColorHex,
    this.statusBarColorHex,
    this.outlineColorHex,
    this.agentsTextColorHex,
    this.avatarTheme,
  });

  ToolbarAreaThemeMessage toMessage() {
    return ToolbarAreaThemeMessage(
      backgroundColorHex: backgroundColorHex,
      statusBarColorHex: statusBarColorHex,
      outlineColorHex: outlineColorHex,
      agentsTextColorHex: agentsTextColorHex,
      avatarTheme: avatarTheme?.toMessage(),
    );
  }
}

class FHCTheme {
  final String? primaryColorHex;
  final FHCToolbarAreaTheme? toolbarAreaTheme;
  final FHCChatAreaTheme? chatAreaTheme;
  final FHCMessageAreaTheme? messageAreaTheme;
  final FHCPreChatTheme? preChatTheme;
  final FHCSystemAlertsTheme? systemAlertsTheme;

  const FHCTheme({
    this.primaryColorHex,
    this.toolbarAreaTheme,
    this.chatAreaTheme,
    this.messageAreaTheme,
    this.preChatTheme,
    this.systemAlertsTheme,
  });

  ThemeMessage toMessage() {
    return ThemeMessage(
      primaryColorHex: primaryColorHex,
      toolbarAreaTheme: toolbarAreaTheme?.toMessage(),
      chatAreaTheme: chatAreaTheme?.toMessage(),
      messageAreaTheme: messageAreaTheme?.toMessage(),
      preChatTheme: preChatTheme?.toMessage(),
      systemAlertsTheme: systemAlertsTheme?.toMessage(),
    );
  }
}

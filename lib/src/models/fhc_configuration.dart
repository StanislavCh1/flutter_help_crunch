import 'package:flutter_help_crunch/src/messages.g.dart';

/// Represents the configuration details required to initialize HelpCrunch.
///
/// Contains your organization identifier, application ID, and application secret
/// needed to authenticate with the HelpCrunch
class FHCConfiguration {
  /// The name of the organization registered in HelpCrunch.
  final String organization;

  /// The numeric application identifier for your HelpCrunch project.
  final int applicationId;

  /// The secret key associated with your HelpCrunch application.

  final String applicationSecret;
  FHCConfiguration({
    required this.organization,
    required this.applicationId,
    required this.applicationSecret,
  });

  /// Converts this configuration to a platform message format.

  ConfigurationMessage toMessage() {
    return ConfigurationMessage(
      organization: organization,
      applicationId: applicationId,
      applicationSecret: applicationSecret,
    );
  }
}

/// Represents the user data passed to HelpCrunch.
///
/// Used for identifying and personalizing user sessions in chat and analytics.
class FHCUser {
  /// A unique identifier for the user.
  final String id;

  /// The user's display name.

  final String? name;

  /// The user's email address.

  final String? email;

  /// The user's phone number.

  final String? phone;

  FHCUser({required this.id, this.name, this.email, this.phone});

  /// Converts this user object to a platform message format.

  UserMessage toMessage() {
    return UserMessage(
      id: id,
      name: name,
      email: email,
      phone: phone,
    );
  }
}

/// Defines available branding styles for HelpCrunch UI components.

enum FHCBrandingType { light, dark }

/// Defines the appearance of user avatars within the chat interface.

class FHCAvatarTheme {
  /// Whether to use the default avatar color scheme.

  final bool useDefaultAvatarColors;

  /// The background color of the placeholder avatar (ARGB integer).

  final int? placeholderBackgroundColor;

  /// The text color used in placeholder avatars (ARGB integer).

  final int? placeholderTextColor;

  FHCAvatarTheme({
    this.useDefaultAvatarColors = true,
    this.placeholderBackgroundColor,
    this.placeholderTextColor,
  });

  /// Converts this avatar theme to a platform message format.

  AvatarThemeMessage toMessage() {
    return AvatarThemeMessage(
      useDefaultAvatarColors: useDefaultAvatarColors,
      placeholderBackgroundColor: placeholderBackgroundColor,
      placeholderTextColor: placeholderTextColor,
    );
  }
}

// ---------------------------------------------------------------

/// Customizes the appearance of the message area in the chat screen.

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

  /// Converts this message area theme to a platform message format.

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

/// Defines color and style options for the main chat area.
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

  /// Converts this chat area theme to a platform message format.

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

/// Defines the appearance of the pre-chat form screen shown before a chat begins.
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

  /// Converts this pre-chat theme to a platform message format.

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

/// Customizes the appearance of the toolbar area in the chat screen.
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

  /// Converts this toolbar area theme to a platform message format.

  ToolbarAreaThemeMessage toMessage() {
    return ToolbarAreaThemeMessage(
      backgroundColor: backgroundColor,
      statusBarColor: statusBarColor,
      outlineColor: outlineColor,
      agentsTextColor: agentsTextColor,
    );
  }
}

/// Combines all theme areas into a single configuration for HelpCrunch UI.
///
/// This class allows customizing colors, text styles, and layout details
/// for various areas of the HelpCrunch chat interface.
class FHCTheme {
  /// The main accent color used across HelpCrunch UI components.
  final int? primaryColor;

  /// Customizations for the toolbar area.
  final FHCToolbarAreaTheme? toolbarAreaTheme;

  /// Customizations for the chat area.
  final FHCChatAreaTheme? chatAreaTheme;

  /// Customizations for the message input area.
  final FHCMessageAreaTheme? messageAreaTheme;

  /// Customizations for the pre-chat form.
  final FHCPreChatTheme? preChatTheme;

  /// Customizations for avatar elements.
  final FHCAvatarTheme? avatarTheme;

  const FHCTheme({
    this.primaryColor,
    this.toolbarAreaTheme,
    this.chatAreaTheme,
    this.messageAreaTheme,
    this.preChatTheme,
    this.avatarTheme,
  });

  /// Converts this theme configuration to a platform message format.
  ThemeMessage toMessage() {
    return ThemeMessage(
      primaryColor: primaryColor,
      toolbarAreaTheme: toolbarAreaTheme?.toMessage(),
      chatAreaTheme: chatAreaTheme?.toMessage(),
      messageAreaTheme: messageAreaTheme?.toMessage(),
      preChatTheme: preChatTheme?.toMessage(),
      avatarTheme: avatarTheme?.toMessage(),
    );
  }
}

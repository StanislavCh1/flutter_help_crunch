package com.fhc.flutter_help_crunch

import ThemeMessage
import android.graphics.Color
import androidx.annotation.ColorInt
import com.helpcrunch.library.core.options.theme.HCAvatarTheme
import com.helpcrunch.library.core.options.theme.HCChatAreaTheme
import com.helpcrunch.library.core.options.theme.HCMessageAreaTheme
import com.helpcrunch.library.core.options.theme.HCPreChatTheme
import com.helpcrunch.library.core.options.theme.HCSystemAlertsTheme
import com.helpcrunch.library.core.options.theme.HCToolbarAreaTheme

class FlutterHelpCrunchUtil {
    companion object {
        const val HelpCrunchUserBlocked = "user_blocked"
        const val HelpCrunchCantOpenChat = "cant_open_chat"
        @ColorInt
        fun fromHex(hex: String): Int {
            // Normalize input
            var clean = hex.trim()
                .removePrefix("0x")
                .removePrefix("#")

            // Add full opacity alpha if missing
            if (clean.length == 6) {
                clean = "FF$clean"
            }

            // Convert to Int color
            return try {
                clean.toLong(16).toInt()
            } catch (e: NumberFormatException) {
                Color.BLACK // fallback color
            }
        }
    }
}

fun HCMessageAreaTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCMessageAreaTheme.Builder {
    val messageArea = theme?.messageAreaTheme ?: return this

    messageArea.backgroundColorHex
        ?.let { setBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    messageArea.inputOutlineColorHex
        ?.let { setInputOutlineColor(FlutterHelpCrunchUtil.fromHex(it)) }

    messageArea.inputFieldTextColorHex
        ?.let { setInputFieldTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    messageArea.inputFieldTextHintColorHex
        ?.let { setInputFieldTextHintColor(FlutterHelpCrunchUtil.fromHex(it)) }

    messageArea.messageMenuBackgroundColorHex
        ?.let { setMessageMenuBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    messageArea.messageMenuTextColorHex
        ?.let { setMessageMenuTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    messageArea.messageMenuSummaryTextColorHex
        ?.let { setMessageMenuSummaryTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    messageArea.messageMenuIconColorHex
        ?.let { setMessageMenuIconColor(FlutterHelpCrunchUtil.fromHex(it)) }

    return this
}

fun HCChatAreaTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCChatAreaTheme.Builder {
    val chatArea = theme?.chatAreaTheme ?: return this

    chatArea.incomingBubbleColorHex
        ?.let { setIncomingBubbleTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    chatArea.outcomingBubbleTextColorHex
        ?.let { setOutcomingBubbleTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    chatArea.incomingBubbleColorHex
        ?.let { setIncomingBubbleColor(FlutterHelpCrunchUtil.fromHex(it)) }

    chatArea.outcomingBubbleColorHex
        ?.let { setOutcomingBubbleColor(FlutterHelpCrunchUtil.fromHex(it)) }

    chatArea.backgroundColorHex
        ?.let { setBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    // If HCChatAreaTheme.Builder supports branding type

    setBrandingType(
        if (theme.chatAreaTheme.brandingType == BrandingTypeMessage.DARK)
                HCChatAreaTheme.Branding.DARK
        else HCChatAreaTheme.Branding.LIGHT)

    theme.avatarTheme?.let { _ ->
        setAvatarTheme(
            HCAvatarTheme.Builder()
                .applyFromTheme(theme)
                .build()
        )
    }

    return this
}

fun HCAvatarTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCAvatarTheme.Builder {
    val avatarTheme = theme?.avatarTheme ?: return this

    setUseDefaultAvatarColors(avatarTheme.useDefaultAvatarColors)

    avatarTheme.placeholderBackgroundColorHex
        ?.let { setPlaceholderBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    avatarTheme.placeholderTextColorHex
        ?.let { setPlaceholderTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    return this
}

fun HCPreChatTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCPreChatTheme.Builder {
    val preChatTheme = theme?.preChatTheme ?: return this

    preChatTheme.inputFieldTextColorHex
        ?.let { setInputFieldTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    preChatTheme.inputFieldTextHintColorHex
        ?.let { setInputFieldTextHintColor(FlutterHelpCrunchUtil.fromHex(it)) }

    preChatTheme.backgroundColorHex
        ?.let { setBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    preChatTheme.messageBackgroundColorHex
        ?.let { setMessageBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    preChatTheme.messageTextColorHex
        ?.let { setMessageTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    return this
}

fun HCSystemAlertsTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCSystemAlertsTheme.Builder {
    val systemAlertsTheme = theme?.systemAlertsTheme ?: return this

    systemAlertsTheme.dialogsHeaderColorHex
        ?.let { setDialogsHeaderColor(FlutterHelpCrunchUtil.fromHex(it)) }

    systemAlertsTheme.toastsBackgroundColorHex
        ?.let { setToastsBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    systemAlertsTheme.toastsTextColorHex
        ?.let { setToastsTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    systemAlertsTheme.welcomeMessageBackgroundColorHex
        ?.let { setWelcomeMessageBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    systemAlertsTheme.welcomeMessageTextColorHex
        ?.let { setWelcomeMessageTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    systemAlertsTheme.warningDialogsHeaderColorHex
        ?.let { setWarningDialogsHeaderColor(FlutterHelpCrunchUtil.fromHex(it)) }

    return this
}

fun HCToolbarAreaTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCToolbarAreaTheme.Builder {
    val toolbarAreaTheme = theme?.toolbarAreaTheme ?: return this

    toolbarAreaTheme.backgroundColorHex
        ?.let { setBackgroundColor(FlutterHelpCrunchUtil.fromHex(it)) }

    toolbarAreaTheme.statusBarColorHex
        ?.let { setStatusBarColor(FlutterHelpCrunchUtil.fromHex(it)) }

    toolbarAreaTheme.outlineColorHex
        ?.let { setOutlineColor(FlutterHelpCrunchUtil.fromHex(it)) }

    toolbarAreaTheme.agentsTextColorHex
        ?.let { setAgentsTextColor(FlutterHelpCrunchUtil.fromHex(it)) }

    // Nested avatar theme mapping (reuses the existing avatar extension)
    toolbarAreaTheme.avatarTheme?.let { _ ->
        setAvatarTheme(
            HCAvatarTheme.Builder()
                .applyFromTheme(theme)
                .build()
        )
    }

    return this
}

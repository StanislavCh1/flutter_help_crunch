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
    }
}

fun HCMessageAreaTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCMessageAreaTheme.Builder {
    val messageArea = theme?.messageAreaTheme ?: return this

    messageArea.backgroundColor
        ?.let { setBackgroundColor(it.toInt()) }

    messageArea.inputOutlineColor
        ?.let { setInputOutlineColor(it.toInt()) }

    messageArea.inputFieldTextColor
        ?.let { setInputFieldTextColor(it.toInt()) }

    messageArea.inputFieldTextHintColor
        ?.let { setInputFieldTextHintColor(it.toInt()) }

    messageArea.messageMenuBackgroundColor
        ?.let { setMessageMenuBackgroundColor(it.toInt()) }

    messageArea.messageMenuTextColor
        ?.let { setMessageMenuTextColor(it.toInt()) }

    messageArea.messageMenuSummaryTextColor
        ?.let { setMessageMenuSummaryTextColor(it.toInt()) }

    messageArea.messageMenuIconColor
        ?.let { setMessageMenuIconColor(it.toInt()) }

    return this
}

fun HCChatAreaTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCChatAreaTheme.Builder {
    val chatArea = theme?.chatAreaTheme ?: return this
    chatArea.incomingBubbleColor
        ?.let { setIncomingBubbleColor(it.toInt()) }

    chatArea.outcomingBubbleTextColor
        ?.let { setOutcomingBubbleTextColor(it.toInt()) }

    chatArea.incomingBubbleTextColor
        ?.let { setIncomingBubbleTextColor(it.toInt()) }

    chatArea.outcomingBubbleColor
        ?.let { setOutcomingBubbleColor(it.toInt()) }

    chatArea.backgroundColor
        ?.let { setBackgroundColor(it.toInt()) }

    // Code block colors
    chatArea.incomingCodeBackgroundColor
        ?.let { setIncomingCodeBackgroundColor(it.toInt()) }
    chatArea.outcomingCodeBackgroundColor
        ?.let { setOutcomingCodeBackgroundColor(it.toInt()) }
    chatArea.incomingCodeTextColor
        ?.let { setIncomingCodeTextColor(it.toInt()) }
    chatArea.outcomingCodeTextColor
        ?.let { setOutcomingCodeTextColor(it.toInt()) }

    // Block quote colors
    chatArea.incomingBlockQuoteColor
        ?.let { setIncomingBlockQuoteColor(it.toInt()) }
    chatArea.outcomingBlockQuoteColor
        ?.let { setOutcomingBlockQuoteColor(it.toInt()) }

    // 🆕 File & system colors
    chatArea.incomingFileTextColor
        ?.let { setIncomingFileTextColor(it.toInt()) }
    chatArea.outcomingFileTextColor
        ?.let { setOutcomingFileTextColor(it.toInt()) }
    chatArea.authorNameColor
        ?.let { setAuthorNameColor(it.toInt()) }
    chatArea.systemMessageColor
        ?.let { setSystemMessageColor(it.toInt()) }
    chatArea.timeTextColor
        ?.let { setTimeTextColor(it.toInt()) }
    chatArea.progressViewsColor
        ?.let { setProgressViewsColor(it.toInt()) }
    chatArea.chatBackgroundColor
        ?.let { setBackgroundColor(it.toInt()) }

    // If HCChatAreaTheme.Builder supports branding type

    setBrandingType(
        if (theme.chatAreaTheme.brandingType == BrandingTypeMessage.DARK)
            HCChatAreaTheme.Branding.DARK
        else HCChatAreaTheme.Branding.LIGHT)

    setAvatarTheme(
        HCAvatarTheme.Builder()
            .applyFromTheme(theme)
            .build()
    )

    return this
}

fun HCAvatarTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCAvatarTheme.Builder {
    val avatarTheme = theme?.avatarTheme ?: return this

    setUseDefaultAvatarColors(avatarTheme.useDefaultAvatarColors)

    avatarTheme.placeholderBackgroundColor
        ?.let { setPlaceholderBackgroundColor(it.toInt()) }

    avatarTheme.placeholderTextColor
        ?.let { setPlaceholderTextColor(it.toInt()) }

    return this
}

fun HCPreChatTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCPreChatTheme.Builder {
    val preChatTheme = theme?.preChatTheme ?: return this

    preChatTheme.inputFieldTextColor
        ?.let { setInputFieldTextColor(it.toInt()) }

    preChatTheme.inputFieldTextHintColor
        ?.let { setInputFieldTextHintColor(it.toInt()) }

    preChatTheme.backgroundColor
        ?.let { setBackgroundColor(it.toInt()) }

    preChatTheme.messageBackgroundColor
        ?.let { setMessageBackgroundColor(it.toInt()) }

    preChatTheme.messageTextColor
        ?.let { setMessageTextColor(it.toInt()) }

    return this
}

fun HCToolbarAreaTheme.Builder.applyFromTheme(theme: ThemeMessage?): HCToolbarAreaTheme.Builder {
    val toolbarAreaTheme = theme?.toolbarAreaTheme ?: return this

    toolbarAreaTheme.backgroundColor
        ?.let { setBackgroundColor(it.toInt()) }

    toolbarAreaTheme.statusBarColor
        ?.let { setStatusBarColor(it.toInt()) }

    toolbarAreaTheme.outlineColor
        ?.let { setOutlineColor(it.toInt()) }

    toolbarAreaTheme.agentsTextColor
        ?.let { setAgentsTextColor(it.toInt()) }

    setAvatarTheme(
        HCAvatarTheme.Builder()
            .applyFromTheme(theme)
            .build()
    )

    return this
}

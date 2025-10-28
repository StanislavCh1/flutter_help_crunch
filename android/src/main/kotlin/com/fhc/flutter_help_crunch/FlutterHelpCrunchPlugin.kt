package com.fhc.flutter_help_crunch

import ConfigurationMessage
import FlutterHelpCrunchApi
import ThemeMessage
import UserMessage
import android.app.Activity
import android.util.Log
import com.helpcrunch.library.core.Callback

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import com.helpcrunch.library.core.HelpCrunch
import com.helpcrunch.library.core.models.user.HCUser
import com.helpcrunch.library.core.options.HCOptions
import com.helpcrunch.library.core.options.theme.HCAvatarTheme
import com.helpcrunch.library.core.options.theme.HCChatAreaTheme
import com.helpcrunch.library.core.options.theme.HCMessageAreaTheme
import com.helpcrunch.library.core.options.theme.HCPreChatTheme
import com.helpcrunch.library.core.options.theme.HCTheme
import com.helpcrunch.library.core.options.theme.HCToolbarAreaTheme

/** FlutterHelpCrunchPlugin */
class FlutterHelpCrunchPlugin: FlutterPlugin, FlutterHelpCrunchApi {

  companion object {
    const val TAG = "FlutterHelpCrunchPlugin"
  }
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    FlutterHelpCrunchApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }


  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
   FlutterHelpCrunchApi.setUp(binding.binaryMessenger, null)
  }

  override fun initialize(
    configuration: ConfigurationMessage,
    user: UserMessage,
    theme: ThemeMessage?
  ) {
    val hcUser = HCUser.Builder().withUserId(user.id)


    user.phone?.let { hcUser.withPhone(it) }
    user.email?.let { hcUser.withEmail(it) }
    user.name?.let { hcUser.withName(it) }

    val messageAreaTheme = HCMessageAreaTheme.Builder()
      .applyFromTheme(theme).build()
    val messageChatAreaTheme = HCChatAreaTheme.Builder().applyFromTheme(theme).build()
    val preChatTheme = HCPreChatTheme.Builder()
      .applyFromTheme(theme)
      .build()
    val toolbarAreaTheme = HCToolbarAreaTheme.Builder()
      .applyFromTheme(theme)
      .build()

    var options: HCOptions? = null

    if(theme != null) {
      val hcTheme = HCTheme.Builder(theme.primaryColor.toInt())
        .setChatAreaTheme(messageChatAreaTheme)
        .setMessageAreaTheme(messageAreaTheme)
        .setToolbarAreaTheme(toolbarAreaTheme)
        .setPreChatTheme(preChatTheme).build()
      options = HCOptions.Builder().setTheme(hcTheme).build()
    }




    HelpCrunch.initialize(
      configuration.organization,
      configuration.applicationId.toInt(),
      configuration.applicationSecret,
      options = options,
      user = hcUser.build()
    )
  }

  override fun updateUser(user: UserMessage) {
    val hcUser = HCUser.Builder().withUserId(user.id)


    user.phone?.let { hcUser.withPhone(it) }
    user.email?.let { hcUser.withEmail(it) }
    user.name?.let { hcUser.withName(it) }


    HelpCrunch.updateUser(hcUser.build())
  }

  override fun showChatScreen(): Boolean {
    var flutterResult: Boolean = false
    HelpCrunch.showChatScreen(null, object :  Callback<Any?>() {
      override fun onSuccess(result: Any?) {
        Log.i(TAG, "onSuccess::showChatScreen")
        flutterResult = true
        super.onSuccess(result)
      }

      override fun onError(message: String) {
        when (message) {
          FlutterHelpCrunchUtil.HelpCrunchUserBlocked -> Log.e(TAG, "onError::showChatScreen - ${FlutterHelpCrunchUtil.HelpCrunchUserBlocked}")
          FlutterHelpCrunchUtil.HelpCrunchCantOpenChat -> Log.e(TAG, "onError::showChatScreen - ${FlutterHelpCrunchUtil.HelpCrunchCantOpenChat}")
        }
        super.onError(message)
      }
    })

    return flutterResult
  }

  override fun sendMessage(message: String, isForceNewChat: Boolean) {
    HelpCrunch.sendMessage(message, isForceNewChat)
  }

  override fun logout() {
    HelpCrunch.logout(
      object : Callback<Any?>() {
        override fun onError(message: String) {
          Log.e(TAG, "onError::logout ${message}")
          super.onError(message)
        }

        override fun onSuccess(result: Any?) {
          Log.i(TAG, "onSuccess::logout")
          super.onSuccess(result)
        }
      }
    )
  }
}

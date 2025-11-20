import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_help_crunch/flutter_help_crunch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterHelpCrunchPlugin = FlutterHelpCrunch();
  @override
  void initState() {
    super.initState();
    initHelpCrunch();
  }

  FHCTheme _buildTheme() {
    final avatarTheme = FHCAvatarTheme(
      useDefaultAvatarColors: true,
      placeholderBackgroundColor: 0xFF3DCB79,
      placeholderTextColor: 0xFFFFFFFF,
    );
    final messageAreaTheme = FHCMessageAreaTheme(
      backgroundColor: 0xFF3A3A3C,
      inputOutlineColor: 0xFF3A3A3C,
      inputFieldTextColor: 0xFFFFFFFF,
      inputFieldTextHintColor: 0xFF8E8E93,
      messageMenuBackgroundColor: 0xFF3A3A3C,
      messageMenuSummaryTextColor: 0xFFFFFFFF,
      messageMenuIconColor: 0xFFFFFFFF,
      messageMenuTextColor: 0xFFFFFFFF,
    );

    final chatAreaTheme = FHCChatAreaTheme(
      backgroundColor: 0xFF121212,
      brandingType: FHCBrandingType.dark,
      incomingBubbleColor: 0xFF1C1C1E,
      incomingBubbleTextColor: 0xFFFFFFFF,
      outcomingBubbleColor: 0xFFFFA635,
      outcomingBubbleTextColor: 0xFFFFFFFF,
      incomingBlockQuoteColor: 0x7AFFFFFF,
      incomingCodeBackgroundColor: 0xFF2E2E4A,
      incomingCodeTextColor: 0xAEFFFFFF,
      outcomingBlockQuoteColor: 0x7AFFFFFF,
      outcomingCodeBackgroundColor: 0xFF4D4D7F,
      outcomingCodeTextColor: 0xAEFFFFFF,
      incomingFileTextColor: 0xFFFFA635,
      outcomingFileTextColor: 0xFFFFA635,
      authorNameColor: 0xFFFFA635,
      systemMessageColor: 0xFFFFFFFF,
      timeTextColor: 0xFFFFFFFF,
      progressViewsColor: 0xFFFFFFFF,
      chatBackgroundColor: 0xFF121212,
    );

    const toolbarAreaTheme = FHCToolbarAreaTheme(
      agentsTextColor: 0xFFFFFFFF,
      backgroundColor: 0xFF3A3A3C,
      statusBarColor: 0xFF3A3A3C,
      outlineColor: 0xFF3A3A3C,
    );
    const preChatTheme = FHCPreChatTheme(
      backgroundColor: 0xFFFFA635,
      messageBackgroundColor: 0xFFFFA635,
      messageTextColor: 0xFFFFFFFF,
    );

    return FHCTheme(
        chatAreaTheme: chatAreaTheme,
        avatarTheme: avatarTheme,
        messageAreaTheme: messageAreaTheme,
        toolbarAreaTheme: toolbarAreaTheme,
        preChatTheme: preChatTheme,
        primaryColor: Platform.isIOS ? 0xFFFFA635 : null);
  }

  Future<void> initHelpCrunch() async {
    _flutterHelpCrunchPlugin.initialize(
        configuration: FHCConfiguration(
            organization: "", applicationId: -1, applicationSecret: ""),
        user: FHCUser(id: "501990"),
        theme: _buildTheme());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _flutterHelpCrunchPlugin.showChatScreen();
                },
                child: const Text('Show HelpCrunch Chat Screen'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _flutterHelpCrunchPlugin.sendMessage(
                      message: "Hi Ugo, I would like to extend my loan.",
                      isForceNewChat: false);
                },
                child: const Text('Send Message to HelpCrunch'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

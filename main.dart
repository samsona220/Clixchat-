/lib
  main.dart
  screens/
    login_screen.dart
    chat_list_screen.dart
    chat_screen.dart
  widgets/
    message_bubble.dart
pubspec.yamlname: clixchat
description: ClixChat app starter code
publish_to: "none"

environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutterimport 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const ClixChatApp());
}

class ClixChatApp extends StatelessWidget {
  const ClixChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClixChat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(),
    );
  }
}import 'package:flutter/material.dart';
import 'chat_list_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ClixChat Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ChatListScreen(),
              ),
            );
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ClixChat - Chats")),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text("Sarah"),
            subtitle: const Text("Hey, how are you?"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChatScreen(
                    userName: "Sarah",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName;

  const ChatScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userName)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("YOU: How are you?"),
                ),
                ListTile(
                  title: Text("SARAH: I'm great! 😊"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.flash_on),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
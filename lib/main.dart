import 'package:flashchat/view/chat_view.dart';
import 'package:flashchat/view/login_view.dart';
import 'package:flashchat/view/register_view.dart';
import 'package:flashchat/view/welcome_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
        body1: TextStyle(
          color: Colors.black54,
        ),
      )),
      // home: ChatScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegisterView.id: (context) => RegisterView(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}

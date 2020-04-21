import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/controller/rouded_button.dart';
import 'package:flashchat/model/constants.dart';
import 'package:flashchat/view/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_view";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset("images/logo.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) => email = val.toString().trim(),
                style: TextStyle(
                  color: Colors.teal,
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter your email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (val) =>password = val.toString().trim(),
                style: TextStyle(
                  color: Colors.teal,
                ),
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter your password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                colour: Colors.lightBlueAccent,
                onPress: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    AuthResult authResult =
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                    if (authResult.user != null) {
                      setState(() {
                        showSpinner = false;
                      });

                      Navigator.pushNamed(context, ChatScreen.id);
                    } else {
                      _key.currentState
                          .showSnackBar(SnackBar(content: Text(authResult.toString())));
                    }
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    _key.currentState
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                title: "Log In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

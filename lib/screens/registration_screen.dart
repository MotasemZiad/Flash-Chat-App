import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/reusable_text_field.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/icons/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              ReusableTextField(
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                onChange: (value) {
                  email = value;
                },
                borderColor: Colors.blueAccent,
              ),
              SizedBox(
                height: 8.0,
              ),
              ReusableTextField(
                hint: 'Enter your password',
                isSecured: true,
                onChange: (value) {
                  password = value;
                },
                borderColor: Colors.blueAccent,
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Sign up completed successfully'),
                      ));
                      Navigator.pushNamed(context, ChatScreen.id);
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

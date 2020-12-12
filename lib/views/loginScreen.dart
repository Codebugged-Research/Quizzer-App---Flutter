import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/backgroundPainter.dart';
import 'package:quiz_app/components/loginComponent.dart';
import 'package:quiz_app/constants/ui_constants.dart';
import 'package:quiz_app/views/landingScreen.dart';
import 'package:quiz_app/views/signupScreen.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String email = '';
  final formkey = new GlobalKey<FormState>();
  bool isLoading = false;
  String password = '';
  final GlobalKey<ScaffoldState> scaffkey = new GlobalKey<ScaffoldState>();

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    setState(() {
      isLoading = false;
    });
    return false;
  }

  auth() async {
    setState(() {
      isLoading = true;
    });
    if (checkFields()) {
      var payload = json.encode({"email": email, "password": password});
      print(payload);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return LandingScreen(selectedIndex: 0);
      }));
    } else {
      scaffkey.currentState.showSnackBar(new SnackBar(
        content: new Text("Authentication faliure !! Please retry."),
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffkey,
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Container(
          height: UIConstants.fitToHeight(640, context),
          width: UIConstants.fitToWidth(360, context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:16.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome!',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3
                        .copyWith(fontSize: 40),
                  ),
                ),
              ),
              SizedBox(height: UIConstants.fitToHeight(350, context),),
              Padding(
                padding: const EdgeInsets.only(bottom:40.0),
                child: Container(
                  child: LoginButtonComponentAndroid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:week_planner/constants.dart';
import 'package:week_planner/components.dart';
import 'package:week_planner/screens/logIn_screen.dart';
import 'package:week_planner/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcomeScreen';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcf9e9f),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'My Weekly Planner',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFEEFCD),
                fontSize: 50,
              ),
            ),
            RoundedButton(
              function: () {
                Navigator.pushNamed(context, LogInScreen.id);
              },
              color: Color(0xFFefeae4),
              buttonTitle: 'Log in',
            ),
            RoundedButton(
              function: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              color: Color(0xFFefeae4),
              buttonTitle: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}

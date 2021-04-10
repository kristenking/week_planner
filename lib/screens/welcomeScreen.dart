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
        padding: EdgeInsets.only(left: 45.0,
        top: 60.0, bottom: 130.0),
        child: Center(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'My Weekly Planner',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFFFEEFCD),
                    fontSize: 55.0,
                  ),
                ),
              ),
              Positioned(
                top: 80.0,
                left: 5.0,
                child:  Image(image: AssetImage('images/welcome_im.png'),
                        alignment: Alignment.centerRight,),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
              RoundedButton(
                function: () {
                  Navigator.pushNamed(context, LogInScreen.id);
                },
                color: Color(0xFFFEEFCD),
                buttonTitle: 'Log in',
              ),
              RoundedButton(
                function: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
                color: Color(0xFFFEEFCD),
                buttonTitle: 'Register',
              ),
      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





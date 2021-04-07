import 'package:flutter/material.dart';
import 'package:week_planner/components.dart';
import 'package:week_planner/constants.dart';
import 'package:week_planner/screens/planner_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:week_planner/service/auth_service.dart';


class RegisterScreen extends StatelessWidget {
  static const String id = 'register_screen';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcf9e9f),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80),
            TextField(
              controller: _emailController,
              onChanged: (value) {},
              decoration: kTextFieldDecoration,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              onChanged: (value) {},
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
            ),
            RoundedButton(
                function: () async {
                  // context.read<AuthenticationService>().signUp(
                  bool shouldNavigate = await register(
                      _emailController.text, _passwordController.text);
                  if (shouldNavigate) {
                    //  Navigate
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlannerScreen(),
                      ),
                    );
                  }
                },
                color: Color(0xFFFEEFCD),
                buttonTitle: 'Register')
          ],
        ),
      ),
    );
  }
}
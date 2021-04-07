import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:week_planner/screens/register_screen.dart';
import 'package:week_planner/screens/logIn_screen.dart';
import 'package:week_planner/screens/planner_screen.dart';
import 'package:week_planner/screens/welcomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:week_planner/widgets/my_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:week_planner/service/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyPlanner());
}

class MyPlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>(create: (_) => MyProvider()),
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (_) =>
            AuthenticationService(FirebaseAuth.instance).authStateChanges),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'IndieFlower'),
        home: AuthenticationWrapper(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          LogInScreen.id: (context) => LogInScreen(),
          PlannerScreen.id: (context) => PlannerScreen(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return PlannerScreen();
    }
    return RegisterScreen();
  }
}

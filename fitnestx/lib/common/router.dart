import 'package:fitnestx/view/onboard/onboard_screen.dart';
import 'package:fitnestx/view/registration/complete_profile.dart';
import 'package:fitnestx/view/registration/create_account.dart';
import 'package:fitnestx/view/registration/goal_selection.dart';
import 'package:fitnestx/view/sign-in/login_page.dart';
import 'package:fitnestx/view/sign-in/welcome_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> router() {
  return {
    '/onboard': (context) => const Onboarding(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterScreen(),
    '/profile_completion': (context) => const ProfileCompletion(),
    '/goal_selection': (context) => GoalSelectionActivity(),
    // '/welcome': (context) => const WelcomeScreen(name: name),
  };
}

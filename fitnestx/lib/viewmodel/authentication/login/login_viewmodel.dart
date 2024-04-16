import 'package:flutter/material.dart';

import '../../../model/authentication/login_data.dart';
import '../../../view/sign-in/welcome_screen.dart';

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData();

  void updateEmail(String email) {
    loginData.email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    loginData.password = password;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      // Make the API call to login with the provided data
      // For example, using the http package:
      // final response = await http.post('/login', data: loginData);

      // If the API call is successful, navigate to the next screen
      // For example:
      // Navigator.pushNamed(context, '/home');

      // Otherwise, show an error message
      // For example:
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('Invalid email or password'),
      // ));
      if (formKey.currentState!.validate()) {
        /// TODO: Check the Database/Server for the credentials.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen(name: 'Abdelrahman')));
      }
    }
  }

  String? validateEmail(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    else{
      String pattern = r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Incorrect email format..';
      }
      return null;
    }
  }

  String? validatePassword(dynamic value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password should be at least 8 characters long';
    }
    return null;
  }
}
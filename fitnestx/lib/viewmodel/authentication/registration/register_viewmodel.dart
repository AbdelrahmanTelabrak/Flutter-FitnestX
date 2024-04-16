import 'package:fitnestx/model/user/account_data.dart';
import 'package:fitnestx/view/registration/complete_profile.dart';
import 'package:flutter/material.dart';
import '../../../view/sign-in/welcome_screen.dart';

class RegisterViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final AccountData accountData = AccountData();

  void updateFName(String fName) {
    accountData.firstName = fName;
    notifyListeners();
  }

  void updateLName(String lName) {
    accountData.lastName = lName;
    notifyListeners();
  }

  void updateEmail(String email) {
    accountData.email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    accountData.password = password;
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
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

        /// TODO: Check the Database/Server for the credentials/ check if the email is already used before.
        /// IF SUCCESS: then save the id in shared preferences and then use it to save
        /// the user data like his height, weight, etc...
        /// Also to set the Goal they choose
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCompletion()));
      }
    }
  }

  String? validateNames(dynamic value) {
    if (value.isEmpty) {
      return '';
    }
    return null;
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
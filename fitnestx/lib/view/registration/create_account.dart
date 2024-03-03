import 'package:fitnestx/model/user/account_data.dart';
import 'package:fitnestx/view/registration/complete_profile.dart';
import 'package:fitnestx/view/sign-in/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons.dart';
import '../../widgets/textfields.dart';
import '../../widgets/texts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleSection(),
                const SizedBox(height: 30),
                _form(),
                const SizedBox(height: 10),
                _checkSection(),
              ],
            ),
            _bottomSection(),
          ],
        ),
      ),
    );
  }

  Column _titleSection() {
    return Column(
      children: [
        regularText('Hey There,',
            size: TextSize.largeText.value, align: TextAlign.center),
        boldText('Create an Account',
            size: TextSize.h4.value, align: TextAlign.center),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  Form _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          basicFormField(
            controller: _fNameController,
            hint: 'First Name',
            iconPath: 'assets/icons/profile.svg',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          basicFormField(
            controller: _lNameController,
            hint: 'Last Name',
            iconPath: 'assets/icons/profile.svg',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          basicFormField(
            controller: _emailController,
            hint: 'Email',
            iconPath: 'assets/icons/inbox.svg',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              } else {
                String pattern = r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$';
                RegExp regex = RegExp(pattern);
                if (!regex.hasMatch(value)) {
                  return 'Incorrect email format...';
                }
                return null;
              }
            },
          ),
          const SizedBox(height: 15),
          PasswordFormField(
            controller: _passwordController,
            hint: 'Password',
            iconPath: 'assets/icons/lock.svg',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Row _checkSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 1),
        SizedBox(
          width: 16,
          height: 16,
          child: Checkbox(
            activeColor: const Color(0xffADA4A5),
            side: const BorderSide(
              width: 1.0, // Adjust the border width here
              color: Color(0xffADA4A5), // Adjust the border color here
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'By continuing you accept our ',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffADA4A5),
              ),
              children: [
                TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    color: Color(0xffADA4A5),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      /// Open privacy policy
                    },
                ),
                const TextSpan(
                  text: ' and ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffADA4A5),
                  ),
                ),
                TextSpan(
                  text: 'Term of Use',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    color: Color(0xffADA4A5),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      /// Open Term of Use
                    },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Column _bottomSection() {
    return Column(
      children: [
        fullWidthButton(
          child: boldText('Register',
              size: 18, color: Colors.white, align: TextAlign.center),
          onPressed: () {
            if (isChecked) {
              if (_formKey.currentState!.validate()) {
                /// TODO: Add these credentials to the Database/Server.
                AccountData accData = AccountData(_fNameController.value.text,
                    _lNameController.value.text, _emailController.value.text,
                    _passwordController.value.text);
                print(accData.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data') ),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileCompletion()));
              }
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('You need to accept out Privacy Policy and Term of Use')),
              );
            }
            /// if( isChecked )
          },
        ),
        const SizedBox(height: 20),

        ///====== Divider ======
        Stack(
          alignment: Alignment.center,
          children: [
            const Divider(),
            // Divider
            Container(
              width: 34,
              alignment: Alignment.center,
              color: Colors.white,
              child: regularText('Or'),
            ),
          ],
        ),
        const SizedBox(height: 20),

        /// ====== Sign By Google/Facebook ======
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            googleIconButton(
              iconPath: 'assets/icons/google_icon.svg',
              onTap: () {},

              /// TODO: Sign By Google logic
            ),
            const SizedBox(width: 40),
            googleIconButton(
              iconPath: 'assets/icons/facebook_logo.svg',
              onTap: () {},

              /// TODO: Sign By Facebook logic
            ),
          ],
        ),
        const SizedBox(height: 20),

        /// ====== Login Button ======
        RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'Login',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffC58BF2),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
              ),
            ],
          ),
        )
      ],
    );
  }
}

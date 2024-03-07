import 'package:fitnestx/view/registration/create_account.dart';
import 'package:fitnestx/view/sign-in/welcome_screen.dart';
import 'package:fitnestx/widgets/buttons.dart';
import 'package:fitnestx/widgets/textfields.dart';
import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as developer;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
                GestureDetector(
                  onTap: (){developer.log('forgot password', name: 'Login Page');},    // TODO: Forgot password Logic
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: const Color(0xffADA4A5),
                      fontSize: TextSize.mediumText.value,
                    ),
                  ),
                ),
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
        boldText('Welcome Back!',
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
            hint: 'Email',
            iconPath: 'assets/icons/inbox.svg',
            validator: (value) {
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
            },
          ),
          const SizedBox(height: 15),
          PasswordFormField(
            hint: 'Password',
            iconPath: 'assets/icons/lock.svg',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '  Please enter your Password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Column _bottomSection() {
    return Column(
      children: [
        fullWidthButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/login.svg'),
              const SizedBox(width: 10),
              boldText('Login', size: 18, color: Colors.white),
            ],
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              /// TODO: Check the Database/Server for the credentials.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen(name: 'Abdelrahman')));
            }
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
              onTap: () {}, /// TODO: Sign By Google logic
            ),
            const SizedBox(width: 40),
            googleIconButton(
              iconPath: 'assets/icons/facebook_logo.svg',
              onTap: () {}, /// TODO: Sign By Facebook logic
            ),
          ],
        ),
        const SizedBox(height: 20),
        /// ====== Register Button ======
        GestureDetector(
          onTap: () {
            /// TODO: Navigate to Registration page
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
          },
          child: RichText(
            text: const TextSpan(
              text: 'Don’t have an account yet? ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Register',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffC58BF2),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

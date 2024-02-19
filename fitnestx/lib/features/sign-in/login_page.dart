import 'package:fitnestx/widgets/textfields.dart';
import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 50,),
                  regularText('Hey There,', size: TextSize.largeText.value, align: TextAlign.center),
                  boldText('Welcome Back!', size: TextSize.h4.value, align: TextAlign.center),
                  const SizedBox(height: 15,)
                ],
              ),
              Column(
                children: [
                  basicTextField(hint: 'Email', iconPath: 'assets/icons/inbox.svg'),
                  basicTextField(hint: 'Password', iconPath: 'assets/icons/lock.svg'),
                ],
              )
            ],
          ),
          Column(

          ),
        ],
      ),
    );
  }
}

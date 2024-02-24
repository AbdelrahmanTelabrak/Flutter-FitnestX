import 'package:fitnestx/widgets/buttons.dart';
import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 100, 25, 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('assets/images/login/login_welcome.png'),
                  ),
                  SizedBox(height: 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        boldText('Welcome, $name', size: TextSize.h4.value),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 215,
                          child: regularText(
                            'You are all set now, let’s reach your goals together with us',
                            size: TextSize.smallText.value,
                            color: const Color(0xff7B6F72),
                            align: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            fullWidthButton(
              child: boldText('Go To Home', size: 16, color: Colors.white),
              onPressed: () {}, /// TODO: Navigate to Home Screen
            ),
          ],
        ),
      ),
    );
  }
}

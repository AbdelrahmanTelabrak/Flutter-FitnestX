import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';

class OnboardPages extends StatelessWidget {

  final String imagePath;
  final String title;
  final String paragraph;

  const OnboardPages({super.key, required this.imagePath, required this.title, required this.paragraph});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 0,
            child: Image.asset(imagePath, fit: BoxFit.contain,),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(title, size: TextSize.h2.value),
                  regularText(paragraph, size: TextSize.mediumText.value),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

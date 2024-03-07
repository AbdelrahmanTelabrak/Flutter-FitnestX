import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';

class GoalPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String paragraph;

  const GoalPage(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.paragraph});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        gradient: const LinearGradient(
          colors: [
            Color(0xff9DCEFF),
            Color(0xff92A3FD),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(imagePath),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 0,
                        maxWidth: MediaQuery.of(context).size.width,
                    ),
                    child: Column(
                      children: [
                        semiBoldText(
                          title,
                          size: TextSize.mediumText.value,
                          color: Colors.white,
                        ),
                        const SizedBox(
                            width: 50, child: Divider(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    // Ensure text won't be scaled above its original size
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 0,
                        maxWidth: MediaQuery.of(context).size.width,
                        minHeight: 100
                      ),
                      child: regularText(
                        paragraph,
                        size: TextSize.h3.value,
                        align: TextAlign.center,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fitnestx/features/onboard/pages/onboard_page.dart';
import 'package:fitnestx/features/sign-in/login_page.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController(initialPage: 0);
  final _pages = const [
    OnboardPages(
      imagePath: 'assets/images/onboard/onboard1.png',
      title: 'Track Your Goal',
      paragraph:
          'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
    ),
    OnboardPages(
      imagePath: 'assets/images/onboard/onboard2.png',
      title: 'Get Burn',
      paragraph:
          'Let’s keep burning, to achieve yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
    ),
    OnboardPages(
      imagePath: 'assets/images/onboard/onboard3.png',
      title: 'Eat Well',
      paragraph:
          'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
    ),
    OnboardPages(
      imagePath: 'assets/images/onboard/onboard4.png',
      title: 'Improve Sleep  Quality',
      paragraph:
          'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
    ),
  ];

  double _percentage = 0.25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: 4,
          itemBuilder: (context, index) {
            return _pages[index];
          },
          onPageChanged: (value) {
            setState(() {
              _percentage = (value + 1) / _pages.length;
            });
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 65,
                  height: 65,
                  child: CircularProgressIndicator(
                    value: _percentage,
                    color: const Color(0xff92A3FD),

                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff9DCEFF),
                        Color(0xff92A3FD),
                      ],
                    ),
                  ),
                  child: FloatingActionButton(
                    onPressed: _scrollToNextPage,
                    shape: const CircleBorder(),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: const Icon(
                      Icons.chevron_right_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  _scrollToNextPage() {
    if (_controller.page != _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
    }
  }
}

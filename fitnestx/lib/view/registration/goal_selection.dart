import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnestx/view/registration/goal_pages/goal.dart';
import 'package:fitnestx/view/sign-in/welcome_screen.dart';
import 'package:fitnestx/widgets/buttons.dart';
import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/authentication/registration/goal_selection_viewmodel.dart';

class GoalSelectionActivity extends StatelessWidget {
  GoalSelectionActivity({super.key});

  final _viewModel = GoalSelectionViewModel();
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    var _items = _viewModel.getGoals();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                boldText('What is your goal ?',
                    size: TextSize.h4.value),
                SizedBox(
                  width: 180,
                  child: regularText('It will help us to choose a best program for you',
                      size: TextSize.caption.value, align: TextAlign.center),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 11/19,
                  animateToClosest: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  initialPage: _currentPage,
                  onPageChanged: (index, reason) {
                    _currentPage = index;
                  },
                ),
                items: List.generate(3, 
                        (index) => GoalPage(
                            imagePath: _items[index].imagePath, 
                            title: _items[index].title, 
                            paragraph: _items[index].paragraph
                        )),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: fullWidthButton(
                  child: boldText('Confirm', size: 16, color: Colors.white),
                onPressed: () {
                  _viewModel.setUserGoal(_items[_currentPage].goal);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(name: 'Ali')));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fitnestx/common/enums/programs.dart';

class GoalModel{
  Goals goal;
  String imagePath;
  String title;
  String paragraph;

  GoalModel({required this.goal, required this.imagePath, required this.title, required this.paragraph});
}
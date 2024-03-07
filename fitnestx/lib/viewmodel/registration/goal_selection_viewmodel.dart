import '../../common/enums/programs.dart';
import '../../model/goal_model.dart';

class GoalSelectionViewModel {
  List<GoalModel>? _goals;

  List<GoalModel> getGoals() {
    final goals = [Goals.improveShape, Goals.leanTone, Goals.loseFat];
    final titles = ['Improve Shape', 'Lean & Tone', 'Lose a Fat'];
    final paragraphs = [
      'I have a low amount of body fat and need / want to build more muscle',
      'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way',
      'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass'
    ];
    final images = [
      'assets/images/registration/goal_improve.png',
      'assets/images/registration/goal_lean.png',
      'assets/images/registration/goal_fat.png',
    ];
    _goals = List.generate(
      3,
      (index) => GoalModel(
        goal: goals[index],
        imagePath: images[index],
        title: titles[index],
        paragraph: paragraphs[index],
      ),
    );
    return _goals!;
  }

  void setUserGoal(Goals goal){
    /// Get User profile and add the goal value to it
    /// Also you could make a request to prepare the exercise plans for his goal
  }
}

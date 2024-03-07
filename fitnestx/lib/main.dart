import 'package:device_preview/device_preview.dart';
import 'package:fitnestx/view/onboard/onboard_screen.dart';
import 'package:fitnestx/view/registration/complete_profile.dart';
import 'package:fitnestx/view/registration/goal_selection.dart';
import 'package:fitnestx/view/sign-in/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  ));
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: GoalSelectionActivity(),
    );
  }


}

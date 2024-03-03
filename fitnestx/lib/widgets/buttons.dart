import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Container fullWidthButton({required Widget child, Function()? onPressed}){
//   return Container(
//     height: 60,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.transparent),
//       gradient: const LinearGradient(
//         colors: [
//           Color(0xff9DCEFF),
//           Color(0xff92A3FD),
//         ],
//       ),
//       borderRadius: BorderRadius.circular(100),
//     ),
//     child: TextButton(
//       onPressed: onPressed,
//       child: child,
//     ),
//   );
// }
Widget fullWidthButton({required Widget child, Function()? onPressed}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.transparent),
      gradient: const LinearGradient(
        colors: [
          Color(0xff9DCEFF),
          Color(0xff92A3FD),
        ],
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x809DCEFF),
          blurRadius: 20,
          spreadRadius: 0.5,
          offset: Offset(0, 10)
        ),
      ],
      borderRadius: BorderRadius.circular(100),
    ),
    child: MaterialButton(
      minWidth: double.infinity,
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: child,
    ),
  );
}

Widget googleIconButton({required String iconPath, required Function() onTap}) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffDDDADA)),
      borderRadius: BorderRadius.circular(14),
    ),
    child: IconButton(
      icon: SvgPicture.asset(iconPath, width: 20, height: 20),
      onPressed: onTap,
    ),
  );
}
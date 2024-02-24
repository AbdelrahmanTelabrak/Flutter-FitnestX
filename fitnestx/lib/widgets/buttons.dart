import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Container fullWidthButton({required Widget child, Function()? onPressed}){
  return Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.transparent),
      gradient: const LinearGradient(
        colors: [
          Color(0xff9DCEFF),
          Color(0xff92A3FD),
        ],
      ),
      borderRadius: BorderRadius.circular(100),
    ),
    child: TextButton(
      onPressed: onPressed,
      child: child,
    ),
  );
}

Widget googleIconButton({required String iconPath, required Function() onTap}){
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
import 'package:flutter/material.dart';

enum TextSize {
  h1,
  h2,
  h3,
  h4,
  subtitle,
  largeText,
  mediumText,
  smallText,
  caption
}

extension TextSizeExtension on TextSize {
  double get value {
    switch (this) {
      case TextSize.h1:
        return 26.0;
      case TextSize.h2:
        return 24.0;
      case TextSize.h3:
        return 22.0;
      case TextSize.h4:
        return 20.0;
      case TextSize.largeText:
        return 18.0;
      case TextSize.mediumText:
        return 16.0;
      case TextSize.smallText:
        return 14.0;
      case TextSize.caption:
        return 12.0;
      default:
        throw Exception("Unknown TextSize");
    }
  }
}

Widget boldText(String txt, { double size = 12, TextAlign align  = TextAlign.start, Color color = Colors.black}){
  return Text(
    txt,
    textAlign: align,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget semiBoldText(String txt, { double size = 12, TextAlign align  = TextAlign.justify}){
  return Text(
    txt,
    textAlign: align,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget mediumText(String txt, { double size = 12, TextAlign align  = TextAlign.justify}){
  return Text(
    txt,
    textAlign: align,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget regularText(String txt, { double size = 12, TextAlign align  = TextAlign.start, Color color = Colors.black}){
  return Text(
    txt,
    textAlign: align,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}
import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget basicTextField({required String hint, TextEditingController? controller, required String iconPath}){
  return Container(
    height: 50,
    margin: const EdgeInsets.only(left: 25, right: 25, top: 15),
    child: TextField(
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: TextSize.smallText.value,
            color: const Color(0xffADA4A5),
          ),
          filled: true,
          fillColor: const Color(0xffF7F8F8),

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(iconPath, ),
          )
      ),
    ),
  );
}
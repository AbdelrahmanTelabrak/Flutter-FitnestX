import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget basicFormField(
    {required String hint,
    TextEditingController? controller,
    required String iconPath,
    required FormFieldValidator validator,
    bool enabled = true,
      TextInputType keyboardType = TextInputType.text}) {
  return TextFormField(
    maxLines: 1,
    validator: validator,
    controller: controller,
    enabled: enabled,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: TextSize.smallText.value,
        color: const Color(0xffADA4A5),
      ),
      filled: true,
      fillColor: const Color(0xffF7F8F8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(
          iconPath,
          width: 18,
          height: 18,
        ),
      ),
      errorStyle: const TextStyle(height: 0),
    ),
  );
}
//
// Widget dropDownFormField({required List<DropdownMenuItem> items, required dynamic value, }){
//   return DropdownButtonFormField(
//     items: items,
//     value: value,
//     onChanged: (value) {
//       setState(() {
//         _genderValue = value;
//       });
//     } ,
//     decoration: InputDecoration(
//       contentPadding: const EdgeInsets.only(top: 15, bottom: 15, right: 10),
//       hintText: 'Choose Gender',
//       hintStyle: TextStyle(
//         fontSize: TextSize.smallText.value,
//         color: const Color(0xffADA4A5),
//       ),
//       filled: true,
//       fillColor: const Color(0xffF7F8F8),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
//       prefixIcon: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: SvgPicture.asset(
//           'assets/icons/profile2.svg',
//           width: 18,
//           height: 18,
//         ),
//       ),
//     ),
//   );
// }


class PasswordFormField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final String iconPath;
  final FormFieldValidator<String>? validator;

  const PasswordFormField({
    Key? key,
    required this.hint,
    this.controller,
    required this.iconPath,
    required this.validator,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      maxLines: 1,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: TextSize.smallText.value,
          color: const Color(0xffADA4A5),
        ),
        filled: true,
        fillColor: const Color(0xffF7F8F8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            widget.iconPath,
            width: 18,
            height: 18,
          ),
        ),
        suffixIcon: IconButton(
          icon: SvgPicture.asset('assets/icons/visibility_off.svg'),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }
}

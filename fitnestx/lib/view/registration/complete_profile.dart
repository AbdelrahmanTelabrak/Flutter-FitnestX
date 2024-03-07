import 'package:fitnestx/view/registration/goal_selection.dart';
import 'package:fitnestx/widgets/buttons.dart';
import 'package:fitnestx/widgets/textfields.dart';
import 'package:fitnestx/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProfileCompletion extends StatefulWidget {
  const ProfileCompletion({super.key});

  @override
  State<ProfileCompletion> createState() => _ProfileCompletionState();
}

class _ProfileCompletionState extends State<ProfileCompletion> {
  final _formKey = GlobalKey<FormState>();
  final _dobController = TextEditingController();

  String? _genderValue;
  final _genderDrops = [
    DropdownMenuItem(
      value: 'male',
      child: mediumText('Male'),
    ),
    DropdownMenuItem(
      value: 'female',
      child: mediumText('Female'),
    )
  ];

  bool isKG = true;
  bool isMetric = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 3,
                      child: Image.asset(
                          'assets/images/registration/profile_completion.png')),
                  Expanded(
                    child: Column(
                      children: [
                        boldText('Let’s complete your profile',
                            size: TextSize.h4.value),
                        regularText('It will help us to know more about you!',
                            size: TextSize.caption.value),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _formSection(),
                  fullWidthButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        boldText('Next', size: 16, color: Colors.white),
                        const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white)
                      ],
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()){

                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GoalSelectionActivity()));
                      // else{
                      //   Fluttertoast.showToast(
                      //       msg: "Please enter the missing fields",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.CENTER,
                      //       backgroundColor: Colors.grey,
                      //       textColor: Colors.white,
                      //       fontSize: 16.0
                      //   );
                      // }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderSection(){
    return DropdownButtonFormField(
      items: _genderDrops,
      value: _genderValue,
      onChanged: (value) {
        setState(() {
          _genderValue = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
            top: 15, bottom: 15, right: 10),
        hintText: 'Choose Gender',
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
            'assets/icons/profile2.svg',
            width: 18,
            height: 18,
          ),
        ),
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }

  Widget _datePicker() {
    return TextFormField(
      maxLines: 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        /// TODO: check if the user is more than 13 years old and less than 100 years
        return null;
      },
      controller: _dobController,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showDialog<Widget>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                width: 300, // Adjust width as needed
                height: 400, // Adjust height as needed
                child: SfDateRangePicker(
                  backgroundColor: Colors.white,
                  view: DateRangePickerView.month,
                  showTodayButton: true,
                  showActionButtons: true,
                  onSubmit: (value) {
                    _dobController.text = value.toString();
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        );
      },
      showCursor: false,
      keyboardType: TextInputType.none,
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        hintText: 'Date of Birth',
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
            'assets/icons/calendar.svg',
            width: 18,
            height: 18,
          ),
        ),
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }

  Row _weightSection(){
    return Row(
      children: [
        Expanded(
          child: basicFormField(
            hint: 'Your Weight',
            iconPath: 'assets/icons/scale.svg',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 15),
        DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xffEEA4CE),
                  Color(0xffC58BF2),
                ]
            ),
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: SizedBox(
            width: 48,
            height: 48,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  isKG = !isKG;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              padding: EdgeInsets.zero,
              child: mediumText(
                isKG? 'KG' : 'LB',
                size: TextSize.smallText.value,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _heightSection(){
    return Row(
      children: [
        Expanded(
          child: basicFormField(
            hint: 'Your Height',
            iconPath: 'assets/icons/height.svg',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 15),
        DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xffEEA4CE),
                  Color(0xffC58BF2),
                ]
            ),
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: SizedBox(
            width: 48,
            height: 48,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  isMetric = !isMetric;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              padding: EdgeInsets.zero,
              child: mediumText(
                isMetric? 'CM' : 'FT',
                size: TextSize.smallText.value,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  Form _formSection(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _genderSection(),
          const SizedBox(height: 15),
          _datePicker(),
          const SizedBox(height: 15),
          _weightSection(),
          const SizedBox(height: 15),
          _heightSection(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

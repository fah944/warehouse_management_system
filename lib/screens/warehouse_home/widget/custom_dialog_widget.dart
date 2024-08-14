import 'package:flutter/material.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/style_manager.dart';
import 'elevated_btn_widget.dart';

class CustomDialogFieldWidget extends StatelessWidget {
  const CustomDialogFieldWidget({Key? key, required this.title, required this.hintText, required this.onPressed, this.controller, this.validator}) : super(key: key);

  final String title;
  final String hintText;
  final Function onPressed;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: StyleManager.h3Medium(color: ColorManager.blackColor),
      ),
      content: TextFormField(
        autofocus: true,
        decoration:InputDecoration(
          hintText: hintText,
        ),
        controller: controller,
        validator: validator ??
                (value) {
              if (value?.isEmpty ?? true) {
                return 'this field must not be empty';
              }
              return null;
            },
      ),
      actions: [
        elevatedbtn(
          text: 'submit',
          style: StyleManager.labelMedium(color: ColorManager.blackColor),
          onPressed:(){
            onPressed();
          },
        ),
      ],
    );
  }
}

class CustomAlertDialogWidget extends StatelessWidget {
  const CustomAlertDialogWidget({Key? key, required this.message, required this.buttonText1, required this.buttonText2, required this.onPressed1, required this.onPressed2,}) : super(key: key);

  final String message;
  final String buttonText1;
  final String buttonText2;
  final Function onPressed1;
  final Function onPressed2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        message,
      ),
      actions: [
        Row(
          children: [
            elevatedbtn(
              text: buttonText1,
              style: StyleManager.labelMedium(color: ColorManager.blackColor),
              onPressed:(){
                onPressed1();
              },
            ),
            elevatedbtn(
              text: buttonText2,
              style: StyleManager.labelMedium(color: ColorManager.blackColor),
              onPressed:(){
                onPressed2();
              },
            )
          ],
        ),
      ],
    );
  }
}


Future openDialog({
  required BuildContext context,
  required String title,
  required String hintText,
  required Function onPressed,
  required TextEditingController? controller,
})=>showDialog(
    context: context,
    builder:(context)=> AlertDialog(
      title: Text(
        title,
        style: StyleManager.h3Medium(color: ColorManager.blackColor),
      ),
      content: TextField(
        autofocus: true,
        decoration:InputDecoration(
          hintText: hintText,
        ),
        controller: controller,
      ),
      actions: [
        elevatedbtn(
          text: 'submit',
          style: StyleManager.labelMedium(color: ColorManager.blackColor),
          onPressed:(){
            onPressed();
          },
        ),
      ],
     )
  );
                 

   
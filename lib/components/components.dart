import 'package:flutter/material.dart';
Widget defaultForm({
  required TextEditingController controller,
  required TextInputType type,
  required IconData prefixIcon,
  IconData? sufixIcon,
  bool validate = false,
  String validationMessage = 'This field is required',
  bool isPassword = false,
  required String label,
  required Function() suffixIconPressed,
  isClickable = true,
  Function()? onSubmit,
  Function()? onTap,
}) {
  return TextFormField(

    controller: controller,
    obscureText: isPassword == true ? true : false,
    keyboardType: type,
    validator: validate == true
        ? (value) {
            if (value!.isEmpty) {
              return validationMessage;
            }
            if (isPassword == true && value.length < 4) {
              return 'The Password is too short';
            }
            return null;
          }
        : null,
    onTap: onTap,
    enabled: isClickable,
    decoration: InputDecoration(
      fillColor: Color.fromARGB(255, 57, 57, 57),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: sufixIcon != null
          ? GestureDetector(
              onTap: suffixIconPressed,
              child: Icon(sufixIcon),
            )
          : null,
      labelText: label,
      ),
  );
}

messanger(
    {required BuildContext context,
    required String message,
    bool status = true}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
  ));
}

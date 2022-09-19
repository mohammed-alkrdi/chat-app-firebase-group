import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Color textColor;
  final Color color;
  final double width;
  final bool obscureText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  Function(String? value) onSaved;
  String? Function(String? value) validator;
  

  TextInputField({Key? key,
    required this.hint,
    required this.icon,
    required this.textColor,
    required this.color,
    required this.obscureText,
    required this.inputType,
    required this.inputAction,
    required this.validator,
    required this.onSaved,
    required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
          prefixIcon: Icon(icon, color: color,),
          labelText: hint,
          labelStyle: TextStyle(color: color),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
          errorStyle: TextStyle(color: color),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
      ),
      validator: validator,
      onChanged: onSaved,
      obscureText: obscureText,
      keyboardType: inputType,
      textInputAction: inputAction,
    );
  }
}

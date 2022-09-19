import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Alignment? textAlignment;
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final String? textFontFamily;

  const TextInput(
      {Key? key,
      required this.text,
      this.textColor = Colors.black,
      this.textAlignment = Alignment.center,
      this.textFontSize = 16,
      this.textFontWeight,
      this.textFontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: textAlignment,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
          fontFamily: textFontFamily,
        ),
      ),
    );
  }
}

import 'package:chat_fire_base/widgets/text_input.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color textColor;
  final Color color;
  final Alignment alignment;
  final double?sizeHeight;
  final double fontSize;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.textColor,
      required this.color,
      required this.alignment,
      this.sizeHeight,
      required this.fontSize,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: TextInput(
          text: text,
          textColor: textColor,
          textAlignment: alignment,
          textFontSize: fontSize,
        ),
      ),
    );
  }
}

import 'package:chat_fire_base/widgets/text_input.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final bool select;
  final Color? selectedColor;
  final IconData icon;
  final void Function() onPressed;
  TextInput textInput;

  DrawerTile(
      {Key? key,
      required this.textInput,
      this.select = false,
      this.selectedColor,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      selectedColor: selectedColor,
      selected: select,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Icon(icon),
      title: textInput,
    );
  }
}

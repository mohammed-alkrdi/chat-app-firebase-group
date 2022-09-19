import 'package:chat_fire_base/helper/app_colors.dart';
import 'package:chat_fire_base/widgets/text_input.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.logoColor2,
        title: const TextInput(
          text: "Settings",
          textFontWeight: FontWeight.bold,
          textColor: Colors.white,
          textFontSize: 27,
          textAlignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}

import 'package:chat_fire_base/helper/app_colors.dart';
import 'package:chat_fire_base/service/auth_services.dart';
import 'package:chat_fire_base/widgets/text_input.dart';
import 'package:flutter/material.dart';

import '../helper/helpers_fuctions.dart';
import '../widgets/icon_profile.dart';
import '../widgets/profile_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = "";
  String password = "";
  String fullName = "";
  String phoneNumber = "";
  AuthServices authServices = AuthServices();

  @override
  initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        fullName = val!;
      });
    });
    await HelperFunctions.getUserPhoneNumberSF().then((phoneVal) {
      setState(() {
        phoneNumber = phoneVal!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.logoColor2,
        title: const TextInput(
          text: "Profile",
          textColor: Colors.white,
          textAlignment: Alignment.centerLeft,
          textFontSize: 27,
          textFontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget> [
              CircleAvatar(
                maxRadius: 60,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/images/chatlogo.png'),
              ),
              //const SizedBox(height: 5,),
              TextInput(
                  text: "Photon",
                  textColor: AppColors.logoColor1,
                  textFontFamily: "Pacifico",
                  textFontSize: 40,
                  textFontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: AppColors.logoColor1,
                ),
              ),
              SizedBox(height: 20,),
              ProfileInfo(
                appIcons:AppIcons(
                  icon: Icons.person,
                  backgroundColor: AppColors.logoColor2,
                  iconColor: Colors.white,
                  size: 50,
                  iconSize: 25,
                ),
                textInput: TextInput(
                    text: fullName,
                    textColor: AppColors.logoColor1,
                    textFontFamily: "SourceSansPro-Regular.ttf",
                ),
              ),
              const SizedBox(height: 20,),
              ProfileInfo(
                appIcons:AppIcons(
                  icon: Icons.phone,
                  backgroundColor: AppColors.logoColor2,
                  iconColor: Colors.white,
                  size: 50,
                  iconSize: 25,
                ),
                textInput: TextInput(
                  text: phoneNumber,
                  textColor: AppColors.logoColor1,
                  textFontFamily: "SourceSansPro-Regular.ttf",
                ),
              ),
              const SizedBox(height: 20,),
              ProfileInfo(
                appIcons:AppIcons(
                  icon: Icons.email,
                  backgroundColor: AppColors.logoColor2,
                  iconColor: Colors.white,
                  size: 50,
                  iconSize: 25,
                ),
                textInput: TextInput(
                  text: email,
                  textColor: AppColors.logoColor1,
                  textFontFamily: "SourceSansPro-Regular.ttf",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

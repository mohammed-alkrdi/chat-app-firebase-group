import 'package:chat_fire_base/helper/app_colors.dart';
import 'package:chat_fire_base/helper/helpers_fuctions.dart';
import 'package:chat_fire_base/screens/auth/register_screen.dart';
import 'package:chat_fire_base/service/auth_services.dart';
import 'package:chat_fire_base/widgets/text_input.dart';
import 'package:chat_fire_base/widgets/elevated_button.dart';
import 'package:chat_fire_base/widgets/text_form_field_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/database_services.dart';
import '../home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isloading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? Center(
        child: CircularProgressIndicator(
          color: AppColors.logoColor1,
        ),
      )
          : SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 60,
                  backgroundColor: Colors.transparent,
                  child: Image.asset('assets/images/chatlogo.png'),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInput(
                  text: "Photon Chat",
                  textColor: AppColors.logoColor1,
                  textFontSize: 24,
                  textFontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextInput(
                  text: "Login now to chat and talk with your friends",
                  textColor: Colors.grey,
                  textFontSize: 15,
                  textFontWeight: FontWeight.w400,
                ),
                Image.asset('assets/images/login.png'),
                TextInputField(
                  hint: 'Email',
                  icon: Icons.email,
                  textColor: Colors.black,
                  color: AppColors.logoColor2,
                  obscureText: false,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  validator: (value) {
                    return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)
                        ? null
                        : "Please enter a valid email";
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                      print(email);
                    });
                  },
                  width: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextInputField(
                  hint: 'Password',
                  icon: Icons.lock,
                  textColor: Colors.black,
                  color: AppColors.logoColor2,
                  obscureText: true,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                  width: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundedButton(
                  text: 'Sign in',
                  onPressed: () {
                    login();
                  },
                  textColor: Colors.white,
                  color: AppColors.logoColor2,
                  alignment: Alignment.center,
                  fontSize: 16,
                  sizeHeight: 40,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextInput(
                      text: "Don't have an account?",
                      textFontSize: 14,
                      textColor: Colors.grey,
                      textAlignment: Alignment.center,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Get.to(() => const RegisterScreen(),
                              transition: Transition.fade),
                      //nextScreen(context, const RegisterScreen()),
                      child: TextInput(
                        text: 'Register here',
                        textColor: AppColors.logoColor2,
                        textFontSize: 14,
                        textAlignment: Alignment.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await authServices
          .loginUserWithEmailAndPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot = await DatabaseService(
              uid: FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(email);
          //saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]["fullName"]);
          await HelperFunctions.saveUserPhoneNumberSF(snapshot.docs[0]["phoneNumber"]);
          Get.to(() => const HomeScreen(),
              transition: Transition.zoom);
        }
        else {
          showSnackBar(context, AppColors.logoColor1, value);
        setState(() {
        _isloading = false;
        });
      }
      });
    }
  }
}

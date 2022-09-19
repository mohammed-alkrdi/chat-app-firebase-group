import 'dart:ffi';

import 'package:chat_fire_base/screens/auth/login_screen.dart';
import 'package:chat_fire_base/screens/home_page.dart';
//import 'package:chat_fire_base/screens/home_page.dart';
import 'package:chat_fire_base/service/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../helper/app_colors.dart';
import '../../helper/helpers_fuctions.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_form_field_input.dart';
import '../../widgets/text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isloading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  String phoneNumber = "";
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
                        text: "Create your account now to chat and explore",
                        textColor: Colors.grey,
                        textFontSize: 15,
                        textFontWeight: FontWeight.w400,
                      ),
                      Image.asset('assets/images/register.png'),
                      TextInputField(
                        hint: 'Full Name',
                        icon: Icons.person,
                        textColor: Colors.black,
                        color: AppColors.logoColor2,
                        obscureText: false,
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Name cannot be empty";
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            fullName = value!;
                            //print(email);
                          });
                        },
                        width: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      /*Row(
                        children: [
                          Expanded(
                            child: CountryPickerDropdown(
                              initialValue: 'in',
                              itemBuilder: _buildDropdownItem,
                              onValuePicked: (Country country) {
                                print("${country.name}");
                              },
                            ),
                          ),
                          Expanded(
                            child: TextInputField(
                              hint: 'Phone Number',
                              icon: Icons.phone,
                              textColor: Colors.black,
                              color: AppColors.logoColor2,
                              obscureText: false,
                              inputType: TextInputType.number,
                              inputAction: TextInputAction.next,
                              validator: (value) {
                                return RegExp(
                                    r"[0-9].")
                                    .hasMatch(value!)
                                    ? null
                                    : "Please enter a valid phone number";
                              },
                              onSaved: (value) {
                                setState(() {
                                  phoneNumber = value!;
                                  //print(email);
                                });
                              },
                              width: 2,
                            ),
                          ),
                        ],
                      ),*/
                      /*IntlPhoneField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          //prefixIcon: Icon(icon, color: color,),
                          labelText: "Phone number",
                          labelStyle:  TextStyle(
                            color: AppColors.logoColor2,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.logoColor2, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.logoColor2, width: 2),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.logoColor2, width: 2),
                          ),
                          errorStyle: TextStyle(
                            color: AppColors.logoColor2,
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.logoColor2, width: 2),
                          ),
                        ),
                        onChanged: (phoneNumber) {
                            phoneNumber = phoneNumber;
                            //print(value);
                        },
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),*/
                      TextInputField(
                          hint: 'Phone number',
                          icon: Icons.phone,
                          textColor: Colors.black,
                          color: AppColors.logoColor2,
                          obscureText: false,
                          inputType: TextInputType.phone,
                          inputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Phone number cannot be empty";
                          }
                        },
                          onSaved: (value) {
                            setState(() {
                              phoneNumber = value!;
                            });
                          },
                          width: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                            //print(email);
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
                        text: 'Register',
                        onPressed: () {
                          register();
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
                            text: "Already have an account?",
                            textFontSize: 14,
                            textColor: Colors.grey,
                            textAlignment: Alignment.center,
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => const LoginScreen(),
                                transition: Transition.zoom),
                            //nextScreen(context, const LoginScreen()),
                            child: TextInput(
                              text: 'Login now',
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

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await authServices
          .registerUserWithEmailAndPassword(
              fullName, email, phoneNumber, password)
          .then((value) async {
        if (value == true) {
          //saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          await HelperFunctions.saveUserPhoneNumberSF(phoneNumber);
          Get.to(() => const HomeScreen(), transition: Transition.zoom);
        } else {
          showSnackBar(context, AppColors.logoColor1, value);
          setState(() {
            _isloading = false;
          });
        }
      });
    }
  }
  /*Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );*/
}

import 'package:chat_fire_base/helper/app_colors.dart';
import 'package:chat_fire_base/helper/helpers_fuctions.dart';
import 'package:chat_fire_base/screens/auth/login_screen.dart';
import 'package:chat_fire_base/screens/profile_screen.dart';
import 'package:chat_fire_base/screens/search_screen.dart';
import 'package:chat_fire_base/screens/settings_screen.dart';
import 'package:chat_fire_base/service/auth_services.dart';
import 'package:chat_fire_base/widgets/list_tile_drawer.dart';
import 'package:chat_fire_base/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "";
  String email = "";
  AuthServices authServices = AuthServices();

  @override
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
        userName = val!;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SearchScreen(),
                  transition: Transition.downToUp);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: AppColors.logoColor2,
        centerTitle: true,
        title: const TextInput(
          text: "Photon",
          textColor: Colors.white,
          textFontSize: 27,
          textFontWeight: FontWeight.bold,
          textAlignment: Alignment.centerLeft,
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 250,
              color: AppColors.logoColor2,
              child: Container(
                width: double.infinity,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              ),
            ),
            DrawerTile(
              select: true,
              selectedColor: AppColors.logoColor2,
              textInput: const TextInput(
                text: "Groups",
                textAlignment: Alignment.bottomLeft,
              ),
              icon: Icons.group,
              onPressed: () {},
            ),
            DrawerTile(
              select: true,
              selectedColor: AppColors.logoColor2,
              textInput: const TextInput(
                text: "Profile",
                textAlignment: Alignment.bottomLeft,
              ),
              icon: Icons.person,
              onPressed: () {
                Get.to(() => const ProfileScreen(),
                    transition: Transition.size);
              },
            ),
            DrawerTile(
              select: true,
              selectedColor: AppColors.logoColor2,
              textInput: const TextInput(
                text: "Settings",
                textAlignment: Alignment.bottomLeft,
              ),
              icon: Icons.settings,
              onPressed: () {
                Get.to(() => const SettingsScreen(),
                    transition: Transition.circularReveal);
              },
            ),
            DrawerTile(
              select: true,
              selectedColor: AppColors.logoColor2,
              textInput: const TextInput(
                text: "Log out",
                textAlignment: Alignment.bottomLeft,
              ),
              icon: Icons.logout,
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(

                      title: const Text("Log out from the app"),
                      content:
                          const Text("Are you sure you want to log out?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () async {
                           await authServices.signOut().whenComplete(() {
                              Get.to(() => const LoginScreen(),
                                  transition: Transition.topLevel);
                            });
                          },
                          child: Text(
                            'yes',
                            style: TextStyle(
                              color: AppColors.logoColor1,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'no',
                            style: TextStyle(
                              color: AppColors.logoColor1,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: groupList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          popUpDialog(context);
        },
        backgroundColor: AppColors.logoColor2,
        child: const Icon(Icons.add, color: Colors.white,size: 30,),
      ),
    );
  }
  popUpDialog(BuildContext context) {

  }

  groupList() {}
}

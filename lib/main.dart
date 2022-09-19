import 'package:chat_fire_base/helper/helpers_fuctions.dart';
import 'package:chat_fire_base/screens/home_page.dart';
import 'package:chat_fire_base/screens/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool  _isSignedIn = false;


  @override
  void initstate() {
    super.initState();
    getUserLoggedInStatus();
  }
  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if(value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: //_isSignedIn ? const HomeScreen() : const LoginScreen(),
      HomeScreen(),



      /*initialRoute: '/',
      routes: {
        'RegisterScreen': (context) => const RegisterScreen(),
        'Login': (context) => const LoginScreen(),
      },*/
    );
  }
}

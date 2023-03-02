import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/widgets/home_page.dart';
import 'package:my_app/widgets/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              
              radius: 60,
              backgroundImage:AssetImage('images/logo.png'),
            ),
            SizedBox(height: 20,),
            Text(
              'CHATBOX',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30,
                  fontStyle:FontStyle.italic,
                  letterSpacing: 10,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    gotologinPage();
  }

  Future<void> checkUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(savekeyName);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      gotoHomePage();
    }
  }

  gotologinPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  gotoHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}

import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/widgets/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const Text(
              'CHATBOX',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 10,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Username"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Username';
                } else {
                  return null;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Password';
                    } else {
                      return null;
                    }
                  }),
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(350, 40))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    checkLogin(context);
                  }
                },
                child: const Text('log in')),
          ]),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;
    if (username == 'ijas' && password == '1234') {
      final sharedprefs = await SharedPreferences.getInstance();
      await sharedprefs.setBool(savekeyName, true);

      gotoHomePage();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 3),
          content: Text("Username Password doesn't match")));
    }
  }

  gotoHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}

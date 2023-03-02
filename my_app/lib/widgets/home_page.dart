import 'package:flutter/material.dart';
import 'package:my_app/widgets/chat_list.dart';
import 'package:my_app/widgets/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.blueGrey),
        title: const Text('CHATBOX'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const
//   Drawer  //
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              accountName: Text("Ijas ahammed"),
              accountEmail: Text("ijasahammed@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ),
            ListTile(
              onTap: (() {
                signout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);

              }),
              leading: const Icon(
                Icons.logout,
                color: Colors.blueGrey,
              ),
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const ChatList(),
    );
  }

  signout() async {
    final sharedprefs = await SharedPreferences.getInstance();
    sharedprefs.clear();
  }
}

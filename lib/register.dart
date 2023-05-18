import 'package:flutter/material.dart';
import 'package:shared_preference/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

//DELETE
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Create a text controller and use it to retrieve the current value
  final name_controller = TextEditingController();
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  late SharedPreferences logindata;

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   name_controller.dispose();
  //   username_controller.dispose();
  //   password_controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Shared Preferences"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Register Form",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: name_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: username_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: password_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                register();
              },
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }

  void register() async {
    logindata = await SharedPreferences.getInstance();

    String name = name_controller.text;
    String username = username_controller.text;
    String password = password_controller.text;

    if (username != '' && password != '') {
      logindata.setString('name', name);
      logindata.setString('username', username);
      logindata.setString('password', password);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SharedPref()));
    }
  }
}

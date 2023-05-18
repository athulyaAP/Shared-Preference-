import 'package:flutter/material.dart';
import 'package:shared_preference/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email_controller = TextEditingController();
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  final gender_controller = TextEditingController();
  final phoneNumber_controller = TextEditingController();
  late SharedPreferences logindata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(height: 60),
          const Image(
            image: AssetImage("assets/icons/pic21.png"),
            width: 100,
            height: 100,
          ),
          const Text(
            '\n\t\tRegister',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: email_controller,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.mail),
                hintText: 'Email',
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: username_controller,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.person_pin),
                hintText: 'User Name',
                labelText: 'User Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: phoneNumber_controller,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.call),
                hintText: 'Phone Number',
                labelText: 'Phone Number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: password_controller,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.visibility_off),
                hintText: 'Password',
                labelText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: gender_controller,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.fingerprint),
                hintText: 'Gender',
                labelText: 'Gender',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, top: 20, bottom: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                onPressed: () {
                  register();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Padding(
                    padding:
                        EdgeInsets.only(top: 9, bottom: 9, left: 20, right: 20),
                    child: Text('SignUp',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SharedPref()));
              },
              child: const Text(
                "\tAlready have an account?? Login",
                style: TextStyle(fontSize: 15, color: Colors.black),
              )),
        ]),
      ),
    );
  }

  void register() async {
    logindata = await SharedPreferences.getInstance();

    String emailId = email_controller.text;
    String username = username_controller.text;
    String password = password_controller.text;
    String genders = gender_controller.text;
    String phoneNo = phoneNumber_controller.text;

    if (username != '' && password != '') {
      logindata.setString('email', emailId);
      logindata.setString('username', username);
      logindata.setString('password', password);
      logindata.setString('gender', genders);
      logindata.setString('phone', phoneNo);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SharedPref()));
    }
  }
}

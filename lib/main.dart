import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:shared_preference/home.dart';
import 'package:shared_preference/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => MaterialApp(
      useInheritedMediaQuery: true,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const SharedPref(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  late SharedPreferences data;
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  late bool newuser;
  late String uname;
  late String pswd;

  @override
  void initState() {
    checkUser();
    getValue();
    super.initState();
  }

  void getValue() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      uname = data.getString('username')!;
      pswd = data.getString('password')!;
    });
  }

  void checkUser() async {
    data = await SharedPreferences.getInstance();
    newuser = (data.getBool('newuser') ?? true);
    if (newuser == false) {
      //newuser
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage("assets/icons/pic3.png"),
              width: 340,
              height: 340,
            ),
            const Text(
              '\n\t\tLogin',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: username_controller,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.mail),
                  hintText: 'User Name',
                  labelText: 'User Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: password_controller,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility_off),
                  hintText: 'Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 215, 8, 42)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, top: 20, bottom: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange),
                      onPressed: () {
                        String username = username_controller.text;
                        String password = password_controller.text;
                        if (username != ' ' &&
                            password != '' &&
                            username == uname &&
                            password == pswd) {
                          print("Login Success");
                          data.setString("username", uname);
                          data.setBool("newuser", false);
                          print(uname);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        } else {
                          //login failed
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: const Text("Login Failed"),
                                  content: const Text(
                                      "Invalid username or password"),
                                  actions: [
                                    TextButton(
                                      child: const Text(
                                        "Ok",
                                        style:
                                            TextStyle(color: Colors.deepOrange),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              }));
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 9, bottom: 9, left: 20, right: 20),
                          child: Text('Login',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text(
                  "\tDon't you have an account?? SignUp",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}

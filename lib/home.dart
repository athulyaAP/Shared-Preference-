import 'package:flutter/material.dart';
import 'package:shared_preference/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences data;
  late String username;

  @override
  void initState() {
    fetchname();
    super.initState();
  }

  void fetchname() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      username = data.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/icons/pic20.png"),
              width: 340,
              height: 340,
            ),
            Text(
              '\n\nHai, Welcome  $username',
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 231, 88, 27))),
                onPressed: () {
                  data.setBool('newuser', true);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SharedPref()));
                },
                child: const Text("LogOut"))
          ],
        ),
      ),
    );
  }
}

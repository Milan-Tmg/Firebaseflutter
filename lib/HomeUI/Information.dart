import 'package:flutter/material.dart';
import 'package:todo_app/HomeUI/Home.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  final usernamecontroller = TextEditingController();
  final Color backgroundcolor = const Color(0xff6C6ACF);
  final Color buttomcolor = const Color(0xff80DF90);
  final Color textfieldColor = const Color(0xffD9DFF4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: textfieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: usernamecontroller,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(buttomcolor)),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

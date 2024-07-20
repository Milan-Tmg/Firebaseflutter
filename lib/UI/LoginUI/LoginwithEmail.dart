import 'package:flutter/material.dart';
import 'package:todo_app/UI/FirebaseAuthServices/registerauth.dart';

class LoginwithEmail extends StatefulWidget {
  const LoginwithEmail({super.key});

  @override
  State<LoginwithEmail> createState() => _LoginwithEmailState();
}

class _LoginwithEmailState extends State<LoginwithEmail> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final Color backgroundcolor = const Color(0xff6C6ACF);
  final Color buttomcolor = const Color(0xff66DC5C);
  final Color textfieldColor = const Color(0xffD9DFF4);
  @override
  Widget build(BuildContext context) {
    final auth = Services(context: context);
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: textfieldColor),
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: textfieldColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(buttomcolor)),
              onPressed: () {
                auth.loginwithemail(
                    emailcontroller.text, passwordcontroller.text);
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

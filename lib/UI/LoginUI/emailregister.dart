import 'package:flutter/material.dart';
import 'package:todo_app/UI/FirebaseAuthServices/registerauth.dart';

class EmailRegister extends StatefulWidget {
  const EmailRegister({super.key});

  @override
  State<EmailRegister> createState() => _EmailRegisterState();
}

class _EmailRegisterState extends State<EmailRegister> {
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
      body: Center(
          child: Padding(
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
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Email',
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
                borderRadius: BorderRadius.circular(10),
              ),
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
              height: 40,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(buttomcolor),
              ),
              onPressed: () {
                auth.registerwithemail(
                    emailcontroller.text, passwordcontroller.text);
              },
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

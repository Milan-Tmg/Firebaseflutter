import 'package:flutter/material.dart';
import 'package:todo_app/UI/FirebaseAuthServices/registerauth.dart';
import 'package:todo_app/UI/LoginUI/LoginwithEmail.dart';
import 'package:todo_app/UI/LoginUI/emailregister.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _phonecontroller = TextEditingController();
  final Color backgroundcolor = const Color(0xff6C6ACF);
  final Color buttomcolor = const Color(0xff66DC5C);
  final Color textfieldColor = const Color(0xffD9DFF4);
  buttonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttomcolor));
  }

  @override
  Widget build(BuildContext context) {
    final auth = Services(context: context);
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
                controller: _phonecontroller,
                decoration: InputDecoration(
                  hintText: 'Phone number',
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
                style: buttonStyle(),
                onPressed: () {
                  auth.register(_phonecontroller.text);
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.black),
                )),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'OR',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              style: buttonStyle(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailRegister()));
              },
              child: const Text(
                'Signin with email',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginwithEmail()));
                },
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Already have an account?'),
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(color: Colors.red),
                        )
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}

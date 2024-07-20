import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/HomeUI/Information.dart';

class Verifycode extends StatefulWidget {
  final String verficationId;
  const Verifycode({super.key, required this.verficationId});

  @override
  State<Verifycode> createState() => _VerifycodeState();
}

class _VerifycodeState extends State<Verifycode> {
  final TextEditingController _code = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _code,
          ),
          TextButton(
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: widget.verficationId,
                  smsCode: _code.text,
                );
                await _auth.signInWithCredential(credential).then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Userinfo()));
                });
              },
              child: const Text('verfiy')),
        ],
      ),
    );
  }
}

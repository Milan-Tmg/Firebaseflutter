import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/HomeUI/Home.dart';
import 'package:todo_app/HomeUI/Information.dart';
import 'package:todo_app/UI/FirebaseAuthServices/verifycode.dart';

class Services {
  final BuildContext context;

  Services({required this.context});

  final _auth = FirebaseAuth.instance;

  void register(final String phonenumber) {
    _auth.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException error) {},
      codeSent: (String verficationId, int? token) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Verifycode(verficationId: verficationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void registerwithemail(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Userinfo())));
  }

  void loginwithemail(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home())));
  }
}

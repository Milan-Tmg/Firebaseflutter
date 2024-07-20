import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/HomeUI/Home.dart';
import 'package:todo_app/UI/LoginUI/register.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/statemangagement/providerstate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => Workpovider(),
    child: const MaterialApp(
      home: Todoapp(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});
  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      final user = auth.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const RegisterPage(),
                fullscreenDialog: true));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: auth.currentUser != null
            ? const Text(
                'Welcomeback',
                style: TextStyle(fontSize: 40),
              )
            : const Text(
                'Welcome',
                style: TextStyle(fontSize: 40),
              ),
      ),
    );
  }
}

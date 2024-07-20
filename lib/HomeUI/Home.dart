import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Database/Databaseservices.dart';

import 'package:todo_app/HomeUI/popupmenu.dart';
import 'package:todo_app/UI/workui/todolist.dart';

//import 'package:todo_application/UI/login/LoginUI/register.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final auth = FirebaseAuth.instance;

class _HomeState extends State<Home> {
  final uid = auth.currentUser!.uid;
  final Color backgroundcolor = const Color(0xff6C6ACF);
  final Color buttomcolor = const Color(0xff66DC5C);
  final Color textfieldColor = const Color(0xffD9DFF4);
  DatabaseServices databaseService = DatabaseServices();
  final textcontroller = TextEditingController();
  final DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Popupmenuscreen(),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello!\nMilan',
                  style: TextStyle(fontSize: 30),
                ),
                Center(
                  child: Text(
                      '${dateTime.day} ${databaseService.getMonth(dateTime.month)}'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const ListTile(
                  title: Text(
                    'Today\'s task',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('5 tasks'),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: ListTile(
                        title: Text(
                          'Remaining: 3',
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text('Completed: 2'),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(buttomcolor)),
                      onPressed: () {
                        //databaseService.create();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Add task'),
                                content: TextFormField(
                                  controller: textcontroller,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      databaseService
                                          .addData(textcontroller.text);
                                      textcontroller.clear();
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Add',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'Add new task',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          todoScreen(context),
        ],
      ),
    );
  }
}

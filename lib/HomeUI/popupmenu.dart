import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/UI/LoginUI/register.dart';
import 'package:todo_app/UI/workui/historylist.dart';

class Popupmenuscreen extends StatelessWidget {
  Popupmenuscreen({super.key});
  final auth = FirebaseAuth.instance;

  final datecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        iconSize: 35,
        icon: const Icon(
          Icons.circle,
          size: 40,
        ),
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              child: ListTile(
                title: Text(
                  'milantamang@gamil.com',
                  style: TextStyle(fontSize: 15),
                ),
                subtitle: Center(
                  child: Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
            ),
            const PopupMenuItem(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Hi! Milan',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('previous record'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('write date'),
                            content: TextFormField(
                              controller: datecontroller,
                              maxLines: null,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Histroy(
                                              filterdate:
                                                  datecontroller.text)));
                                },
                                child: const Text('go'),
                              )
                            ],
                          );
                        });
                  },
                ),
                TextButton(
                  child: const Text('settings'),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Log out'),
                  onPressed: () async {
                    await auth.signOut().then((value) =>
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage())));
                  },
                ),
              ],
            ))
          ];
        });
  }
}

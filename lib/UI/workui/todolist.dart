import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Database/Databaseservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/statemangagement/providerstate.dart';

Widget todoScreen(BuildContext context) {
  final workprovider = Provider.of<Workpovider>(context, listen: false);
  final auth = FirebaseAuth.instance;
  DatabaseServices databaseServices = DatabaseServices();
  TextEditingController editTextController = TextEditingController();
  final uid = auth.currentUser!.uid;
  final ref = FirebaseDatabase.instance.ref();
  const Color todolistbgcolor = Color(0xff8DC2F3);
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: todolistbgcolor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
      ),
      child: FirebaseAnimatedList(
          query: ref.child(uid),
          itemBuilder: (context, snapshot, animation, index) {
            final key = snapshot.key!;
            final work = snapshot.child('Work').value.toString();
            return ListTile(
              leading: IconButton(
                onPressed: () {
                  workprovider.toggleStatus(key);
                },
                icon: Consumer<Workpovider>(
                  builder: (context, value, child) {
                    if (value.isDone(key) == true) {
                      return const Icon(Icons.check_box);
                    } else {
                      return const Icon(Icons.check_box_outline_blank);
                    }
                  },
                ),
              ),
              title: Consumer<Workpovider>(
                builder: (context, value, child) {
                  return Text(work.toUpperCase(),
                      style: TextStyle(
                        decoration: value.isDone(key)
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 20,
                      ));
                },
              ),
              subtitle: Consumer<Workpovider>(
                builder: (context, value, child) {
                  return Text(value.isDone(key) ? 'Done' : '');
                },
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      editTextController.text = work;
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text('Update Data'),
                              content: TextFormField(
                                controller: editTextController,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      databaseServices.updateData(
                                          key, editTextController.text);
                                      editTextController.clear();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('ok')),
                              ],
                            );
                          }));
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  'Are you sure? It will be permanently delete.'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('cancel')),
                                TextButton(
                                    onPressed: () {
                                      databaseServices.deleteData(key);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            );
          }),
    ),
  );
}

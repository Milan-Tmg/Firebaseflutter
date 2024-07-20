import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Histroy extends StatefulWidget {
  final String filterdate;
  const Histroy({super.key, required this.filterdate});

  @override
  State<Histroy> createState() => _histroylistState();
}

class _histroylistState extends State<Histroy> {
  @override
  Widget build(BuildContext context) {
    const Color todolistbgcolor = Color(0xff8DC2F3);
    final ref = FirebaseDatabase.instance.ref();
    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser!.uid;
    int day = int.parse(widget.filterdate);
    final DateTime dateTime =
        DateTime(DateTime.now().year, DateTime.now().month, day);
    final date = DateFormat('yyyy-MM-dd').format(dateTime);
    return Scaffold(
      body: Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: todolistbgcolor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          ),
          child: FirebaseAnimatedList(
              query: ref.child(uid).orderByChild('timestamp').equalTo(date),
              itemBuilder: (context, snapshot, animation, index) {
                final work = snapshot.child('Work').value.toString();
                return ListTile(
                  leading: const Icon(Icons.check_box_outline_blank),
                  title: Text(
                    work.toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: const Text('Done'),
                );
              }),
        ),
      ),
    );
  }
}

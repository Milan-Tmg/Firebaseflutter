import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatabaseServices {
  final ref = FirebaseDatabase.instance.ref();
  final auth = FirebaseAuth.instance;
  final Color todolistbgcolor = const Color(0xff8DC2F3);

  void addData(String work) {
    final uid = auth.currentUser!.uid;
    final newRef = ref.child(uid).push();

    final DateTime dateTime = DateTime.now();
    final String timeStamp = DateFormat('yyyy-MM-dd').format(dateTime);
    print(timeStamp);
    if (auth.currentUser != null) {
      newRef.set({
        'Work': work,
        'timestamp': timeStamp,
        'weekday': getDayofWeek(dateTime.weekday),
      });
    }
  }

  void updateData(String key, String text) {
    final uid = auth.currentUser!.uid;
    ref.child(uid).child(key).update({'Work': text});
  }

  void deleteData(String key) {
    final uid = auth.currentUser!.uid;
    ref.child(uid).child(key).remove();
  }

  String getDayofWeek(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tus';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  String getMonth(int month) {
    switch (month) {
      case DateTime.january:
        return 'Jan';
      case DateTime.february:
        return 'Feb';
      case DateTime.march:
        return 'Mar';
      case DateTime.april:
        return 'Apr';
      case DateTime.may:
        return 'May';
      case DateTime.june:
        return 'Jun';
      case DateTime.july:
        return 'Jul';
      case DateTime.august:
        return 'Aug';
      case DateTime.september:
        return 'Sep';
      case DateTime.october:
        return 'Oct';
      case DateTime.november:
        return 'Nov';
      case DateTime.december:
        return 'Dec';
      default:
        return '';
    }
  }
}

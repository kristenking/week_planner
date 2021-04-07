import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_planner/screens/addPlan_screen.dart';

class MyProvider extends ChangeNotifier {
  Map<String, dynamic> _names = {};

  String name(String key) => _names[key];

  void setName(String key, String newString) {
    _names[key] = newString;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Notes')
        .doc(firebaseUser.uid)
        .set(_names);
  }

  void fetchData() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Notes')
        .doc(firebaseUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        // print('Document data: ${data}');

        _names = data;
      } else {
        print('The document does not exist on the database');
      }
    });
  }
}


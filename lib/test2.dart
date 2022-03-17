// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'dart:collection';
//
// import 'model/user_model.dart';
//
// class test2 extends StatefulWidget {
//   const test2({Key? key}) : super(key: key);
//
//
//   @override
//   _test2State createState() => _test2State();
// }
//
// class _test2State extends State<test2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
//   static Future<List<userModel>> _getEventsFromFirestore() async {
//     CollectionReference ref = FirebaseFirestore.instance.collection('Customer');
//     QuerySnapshot eventsQuery = await ref
//         .where("time", isGreaterThan: new DateTime.now().millisecondsSinceEpoch)
//         .where("food", isEqualTo: true)
//         .getDocuments();
//
//     HashMap<String, userModel> eventsHashMap = new HashMap<String, userModel>();
//
//     eventsQuery.documents.forEach((document) {
//       eventsHashMap.putIfAbsent(document['id'], () => new userModel(
//           cid: document['name'],
//           age: document['time'],
//           contact: document['description'],
//           points: document['event_url'],
//
//
//     });
//
//     return eventsHashMap.values.toList();
//   }
// }

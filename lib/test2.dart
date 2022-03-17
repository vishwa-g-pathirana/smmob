// import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


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

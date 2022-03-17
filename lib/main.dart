import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pubz/cons/constants.dart';
import 'package:pubz/welcomepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: HPrimarycolor,
        scaffoldBackgroundColor: HWhite,
      ),
      home: welcome(),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pubz/userselection.dart';

import 'cons/constants.dart';
import 'home_page.dart';
import 'model/Subusers_user_model.dart';
import 'model/user_model.dart';

class adduser extends StatefulWidget {
  const adduser({Key? key}) : super(key: key);

  @override
  _adduserState createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final firstnameController = TextEditingController();



  final ageController = TextEditingController();
  final genderController = TextEditingController();


  final sizeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.07,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Add multiple users",
                        style: TextStyle(
                          fontSize: 25,
                          color: HPrimarycolor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Column(
                              children: [


                                SizedBox(
                                  height: size.height * 0.01,
                                ),

                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                TextFormField(
                                  controller: firstnameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enter proper name");
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        color: HGrey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HPrimarycolor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HPrimarycolor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: "First Name"),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                TextFormField(
                                  controller: sizeController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enter proper name");
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        color: HGrey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HPrimarycolor,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HPrimarycolor,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      hintText: "Size"),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),

                                SizedBox(
                                  height: size.height * 0.01,
                                ),

                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                TextFormField(
                                  controller: ageController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enter proper age");
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        color: HGrey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HPrimarycolor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HPrimarycolor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: "Age"),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                TextFormField(
                                  controller: genderController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("this form is required");
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        color: HGrey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HPrimarycolor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HPrimarycolor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: "Gender Male/Female"),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      height: 140,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              width: 250,
                              height: 50,
                              child: TextButton(
                                  child: Text("Register".toUpperCase(),
                                      style: TextStyle(fontSize: 14)),
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.all(15)),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              HWhite),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              HPrimarycolor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              side: BorderSide(color: HPrimarycolor)))),
                                  onPressed: () {
                                    postDetailsToFirestore();
                                  }),
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: TextButton(
                                child: Text("Cancel".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(15)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            HPrimarycolor),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            HWhite),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            side: BorderSide(color: HPrimarycolor)))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const test()),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void Signup(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) => {postDetailsToFirestore()})
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    adduserModel usermodel = adduserModel();

    usermodel.email = user!.email;


    usermodel.firstname= firstnameController.text;
    usermodel.age=ageController.text;
    usermodel.gender =genderController.text;
    usermodel.size =sizeController.text;





    await firebaseFirestore
    .collection("Customer")
    .doc(user.uid)
        .collection("subusers")
        .doc(user.uid)
        .set(usermodel.toMap());
    Fluttertoast.showToast(msg: "User added sucessfully");
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => usersel()), (route) => false);
  }
}

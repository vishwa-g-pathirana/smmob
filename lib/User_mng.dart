import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pubz/cons/constants.dart';
import 'package:pubz/userselection.dart';

import 'cons/constants.dart';
import 'cons/constants.dart';
import 'home_page.dart';
import 'model/user_model.dart';
class user_mng extends StatefulWidget {
  const user_mng({Key? key}) : super(key: key);

  @override
  _user_mngState createState() => _user_mngState();
}

class _user_mngState extends State<user_mng> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final firstnameController = TextEditingController();
  final secondnameController = TextEditingController();
  final addressController = TextEditingController();
  final nicController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String dropdownValue = 'Male';
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
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
                                  SizedBox(height: 2,),


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
                                    controller: secondnameController,
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
                                        hintText: "Second Name"),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  TextFormField(
                                    controller: addressController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Enter valid Adress");
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
                                        hintText: "Address"),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  TextFormField(
                                    controller: nicController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Enter proper NIC No");
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
                                        hintText: "NIC number"),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(

                                      border: Border.all(color: HGrey),
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                    ),
                                    height: 50,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: DropdownButton(
                                        value: dropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(color: Colors.deepPurple),

                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>['Male', 'Female']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),),
                                    ),
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
                                    Navigator.pop(
                                      context,
                                      
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
      ),

    );
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    userModel usermodel = userModel();

    usermodel.email = user!.email;


    usermodel.firstname= firstnameController.text;
    usermodel.nic=nicController.text;
    usermodel.gender=dropdownValue;





    await firebaseFirestore
        .collection("Customer")
        .doc(user.uid)


        .set(usermodel.toMap());
    Fluttertoast.showToast(msg: "User added sucessfully");
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => test()), (route) => false);
  }

}

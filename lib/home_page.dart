import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pubz/procheck.dart';
import 'package:pubz/userselection.dart';
import 'package:snapshot/snapshot.dart';

import 'cons/constants.dart';
import 'home.dart';
import 'menubar.dart';
import 'model/user_model.dart';
var scaffoldkey = GlobalKey<ScaffoldState>();

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  final _auth = FirebaseAuth.instance;

  late final dref = FirebaseDatabase.instance.reference();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var collection = FirebaseFirestore.instance.collection('Stock');
  late DatabaseReference databaseReference;
  userModel usermodel = userModel();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  var bill;

  setData() {
    User? user = _auth.currentUser;
    usermodel.email = user!.email;
    dref
        .child(user.uid)
        .set({'id': "12", 'name': "sen", 'age': "23"}).asStream();
  }

  showData() {
    dref.once().then((DatabaseEvent results) {
      print(results.snapshot.value);
      return results.snapshot.value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfbdat().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  late QuerySnapshot querySnapshot;
  static var gent;
  static var size1;
  static var cat;
  @override
  getfbdat() async {
    User? user = _auth.currentUser;
    usermodel.uid = user!.uid;
    var collection = FirebaseFirestore.instance
        .collection('Customer')
        .where('email', isEqualTo: user.email);

    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      gent = data['gender'];
      size1 =  data['size'];


      print(gent);
      return gent;
    }
  }
  _signOut() async {
    await _firebaseAuth.signOut();
  }
  void handleClick(String value) {
    switch (value) {
      case 'user 1':
        break;
      case 'User 2':
        break;
    }
  }
  var on = Color(0xFFFFFFFF);
  var off = Color(0xFF003899);
  bool val = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'SwapMate',
          style: TextStyle(
            color: HPrimarycolor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.segment,
            color: HPrimarycolor,
          ),
          onPressed: () {
            scaffoldkey.currentState!.openDrawer();
          },
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.person_pin_circle_outlined,
              color: HPrimarycolor,
            ),
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'User 1', 'User 2', 'User 3'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: menubar(),
      body: SafeArea(

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: size.height * 0.06,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          child: TextButton(
                              child:
                              Text("For you", style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10, right: 10)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(on),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(off),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          side: BorderSide(color: on)))),
                              onPressed: () {
                                setState(() {
                                  getfbdat();
                                  size1 = "XXL";
                                  on = Color(0xFFFFFFFF);
                                  off = Color(0xFF003899);
                                  val = true;
                                });
                              }),
                        ),
                      ),
                      Container(
                        height: size.height * 0.03,
                        child: VerticalDivider(
                          color: HGrey,
                          thickness: 1.5,
                          width: 20,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          child: TextButton(
                              child:
                              Text("Shorts", style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10, right: 10)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(HGrey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(HWhite),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          side: BorderSide(color: HGrey)))),
                              onPressed: () {
                                setState(() {
                                  size1 = "XL";
                                  off = Color(0xFFFFFFFF);
                                  on = Color(0xFF003899);
                                  val = false;
                                });
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          child: TextButton(
                              child:
                              Text("Denim", style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10, right: 10)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(HGrey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(HWhite),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          side: BorderSide(color: HGrey)))),
                              onPressed: () {
                                setState(() {
                                  off = Color(0xFFFFFFFF);
                                  on = Color(0xFF003899);
                                  val = false;
                                });
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          child: TextButton(
                              child:
                              Text("Accesories", style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10, right: 10)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(HGrey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(HWhite),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          side: BorderSide(color: HGrey)))),
                              onPressed: () {
                                setState(() {
                                  off = Color(0xFFFFFFFF);
                                  on = Color(0xFF003899);
                                  val = false;
                                });
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          child: TextButton(
                              child:
                              Text("shirt", style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10, right: 10)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(HGrey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(HWhite),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          side: BorderSide(color: HGrey)))),
                              onPressed: () {
                                setState(() {
                                  off = Color(0xFFFFFFFF);
                                  on = Color(0xFF003899);
                                  val = false;
                                });
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          child: TextButton(
                              child:
                              Text("frock", style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10, right: 10)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(HGrey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(HWhite),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          side: BorderSide(color: HGrey)))),
                              onPressed: () {
                                setState(() {
                                  off = Color(0xFFFFFFFF);
                                  on = Color(0xFF003899);
                                  val = false;
                                });
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          child: TextButton(
                              child:
                              Text("jacket", style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10, right: 10)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(HGrey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(HWhite),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          side: BorderSide(color: HGrey)))),
                              onPressed: () {
                                setState(() {
                                  off = Color(0xFFFFFFFF);
                                  on = Color(0xFF003899);
                                  val = false;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Center(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('Showroom')
                      .where('size', isEqualTo: size1)
                      .where('category', isEqualTo: gent)
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError)
                      return Text('Error = ${snapshot.error}');

                    if (snapshot.hasData) {
                      final docs = snapshot.data!.docs;
                      return SingleChildScrollView(
                        child: Container(
                          height: size.height * 1,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: docs.length,
                            itemBuilder: (_, i) {
                              final data = docs[i].data();
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 3),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          image: DecorationImage(

                                              fit: BoxFit.fitHeight,
                                              alignment: Alignment.centerLeft,
                                              image: NetworkImage(

                                                  "${data['url']}")
                                          ),
                                          color: Colors.grey,
                                          gradient: LinearGradient(
                                              colors: [
                                                gradientStart,
                                                gradientEnd
                                              ],
                                              begin: FractionalOffset(0.5, 0),
                                              end: FractionalOffset(0, 0.5),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(10)),
                                        ),
                                        height: 150,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [

                                              Text(data['size']),
                                              Text(data['category']),
                                              Text("points ${data['points']}"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Container(
                                    //   height: 150,
                                    //   decoration: new BoxDecoration(),
                                    //   child: ListTile(
                                    //     minVerticalPadding: 20,
                                    //     horizontalTitleGap: 30.00,
                                    //     selectedColor: Colors.red,
                                    //     tileColor: Colors.grey,
                                    //     leading: Text(data['brand']),
                                    //     title: Text(
                                    //         "${data['points']}and${data['tag']}"),
                                    //     subtitle: Text(data['size']),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkuser() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    userModel usermodel = userModel();

    usermodel.email = user!.email;

    await firebaseFirestore
        .collection("Customer")
        .doc(user.uid)
        .collection("subusers")
        .doc(user.phoneNumber)
        .set(usermodel.toMap());
    Fluttertoast.showToast(msg: "User added sucessfully");
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => usersel()), (route) => false);
  }
}

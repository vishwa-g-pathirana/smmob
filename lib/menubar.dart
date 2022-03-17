import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pubz/User_mng.dart';
import 'package:pubz/adduser.dart';
import 'package:pubz/login.dart';

import 'cons/constants.dart';
import 'model/user_model.dart';

class menubar extends StatefulWidget {
  const menubar({Key? key}) : super(key: key);


  @override
  _menubarState createState() => _menubarState();

}

userModel usermodel = userModel();
final _auth = FirebaseAuth.instance;
class _menubarState extends State<menubar> {
  static var gent;
  static var mail;
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
      gent = "${data['name']}";
      mail = "${data['email']}";

      print(gent);
      return gent;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName:
            Text("$gent"),
            accountEmail: Text("$mail"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/pp.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: HPrimarycolor,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  //sample cover photo
                  image: AssetImage("assets/images/cover2.jpg")),
            ),
          ),
          Divider(),

          Divider(),
          ListTile(
            leading: Icon(
              Icons.person_search_outlined,
              color: HPrimarycolor,
            ),
            title: Text(
              'USer management',
              style: TextStyle(
                color: HPrimarycolor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const user_mng()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person_add,
              color: HPrimarycolor,
            ),
            title: Text(
              'Add User',
              style: TextStyle(
                color: HPrimarycolor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const adduser()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shopping_bag_outlined,
              color: HPrimarycolor,
            ),
            title: Text(
              'Showroom',
              style: TextStyle(
                color: HPrimarycolor,
              ),
            ),
            onTap: () {},
          ),


          Divider(),
          ListTile(
            leading: Icon(
              Icons.star_border,
              color: HPrimarycolor,
            ),
            title: Text(
              'Ongoing Orders',
              style: TextStyle(
                color: HPrimarycolor,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.power_settings_new_outlined,
              color: HPrimarycolor,
            ),
            title: Text(
              'Log out',
              style: TextStyle(
                color: HPrimarycolor,
              ),
            ),
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const login()),
              );

            },
          ),
        ],
      ),
    );
  }
}

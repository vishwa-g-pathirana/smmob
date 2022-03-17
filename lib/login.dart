import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pubz/User_mng.dart';
import 'package:pubz/cons/constants.dart';
import 'package:pubz/ResPw/resetpw.dart';
import 'package:pubz/procheck.dart';
import 'package:pubz/signup.dart';
import 'package:pubz/home_page.dart';
import 'package:pubz/userselection.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'adduser.dart';
import 'home.dart';
import 'model/user_model.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

var scaffoldkey = GlobalKey<ScaffoldState>();

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  userModel usermodel = userModel();
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = 'I see you know $namedContact!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text('Signed in successfully.'),
          Text(_contactText),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: () => _handleGetContact(user),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('You are not currently signed in.'),
          ElevatedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  Future<String?> facebookSignin() async {
    try {
      final _instance = FacebookAuth.instance;
      final result = await _instance.login(permissions: ['email']);
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final a = await _auth.signInWithCredential(credential);
        await _instance.getUserData().then((userData) async {
          await _auth.currentUser!.updateEmail(userData['email']);
        });
        return null;
      } else if (result.status == LoginStatus.cancelled) {
        return 'Login cancelled';
      } else {
        return 'Error';
      }
    } catch (e) {
      return e.toString();
    }
  }

  static var gent = "";
  getfbdat() async {
    User? user = _auth.currentUser;
    usermodel.uid = user!.uid;
    var collection = FirebaseFirestore.instance
        .collection('Customer')
        .where('email', isEqualTo: user.email);

    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      gent = "${data['gender']}";
      print(gent);
      return gent;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldkey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HWhite,
        leading: Icon(
          Icons.arrow_back_outlined,
          color: HPrimarycolor,
        ),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Welcome Back To SwapMate",
                  style: TextStyle(
                    fontSize: 25,
                    color: HPrimarycolor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SignInButton(
                      Buttons.Google,
                      text: "Log in with Google",
                      onPressed: () {
                        _handleSignIn();
                      },
                    ),
                  ),
                ),
                SignInButton(
                  Buttons.Facebook,
                  text: "Log in with Facebook",
                  onPressed: () {
                    facebookSignin();
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'Or Login with your e-mail',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: size.height * 0.10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                  ),
                  child: TextFormField(
                    controller: myController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your E-mail");
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HPrimarycolor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Username"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: TextFormField(
                    controller: myController2,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Password is required to login");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Password must be longer than 6 characters");
                      }
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: HGrey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HPrimarycolor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HPrimarycolor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Password"),
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
                              child: Text("login".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(15)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(HWhite),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          HPrimarycolor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: BorderSide(
                                              color: HPrimarycolor)))),
                              onPressed: () {
                                Signin(myController.text, myController2.text);

                              }),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 50,
                        child: TextButton(
                            child: Text("Signup".toUpperCase(),
                                style: TextStyle(fontSize: 14)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        HPrimarycolor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(HWhite),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        side:
                                            BorderSide(color: HPrimarycolor)))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const signup()),
                              );
                            }),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const resetpassword()),
                          );
                        },
                        child: Text(
                          "Forgot ypur password ? ",
                          style: TextStyle(
                            color: HPrimarycolor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Signin(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });

      if ((gent == "Male") || (gent == "Female")) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const test()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const user_mng()),
        );
      }
    }
  }
}

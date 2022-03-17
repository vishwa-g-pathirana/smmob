import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pubz/ResPw/newPw.dart';
import 'package:pubz/code_gen.dart';
import 'package:pubz/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';


import '../cons/constants.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  _resetpasswordState createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  Random random = new Random();
  List<String> attachments = [];
  bool isHTML = false;


  int rngw = 0;
  TextEditingController textEditingController1 = TextEditingController();
  final emailController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final pinController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }
  Future<void> send() async {
    final Email email = Email(
      body: textEditingController1.text,
      subject: 'reset password',
      recipients: [emailController.text],

      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  "Reset Your Password",
                  style: TextStyle(
                    fontSize: 25,
                    color: HPrimarycolor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Text(
              'enter Your email address',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("enter valid email address");
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_forward_outlined),
                      onPressed: () {
                        resetpassword();

                        setState(() {

                          int randomNumber = random.nextInt(10000);
                          rngw = randomNumber;
                          print(rngw);
                        });
                      },
                      color: HPrimarycolor,
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
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
                    hintText: "E-mail Address"),
              ),
            ),
            Text('Enter 6 digit code that we sent to your email address'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: true,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "Enter the code before it expire";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(7),
                    inactiveFillColor: Colors.white,
                    inactiveColor: HPrimarycolor,
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeFillColor: Colors.white,
                    borderWidth: 2,
                    errorBorderColor: HPrimarycolor,
                  ),
                  cursorColor: HCatBak,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController1,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: 250,
                height: 50,
                child: TextButton(
                    child: Text("next".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(HWhite),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(HPrimarycolor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: HPrimarycolor)))),
                    onPressed: () {
                      var inputval = int.parse(textEditingController1.text);
                      print(inputval);
                      print(rngw);
                      if (currentText.isEmpty) {
                        print('input code');
                      } else {
                        if (inputval == rngw) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const newPw()),
                          );
                        } else {
                          print('wrong otp');
                        }
                      }
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
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(HPrimarycolor),
                      backgroundColor: MaterialStateProperty.all<Color>(HWhite),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: HPrimarycolor)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
//    codegen() {
//     var rngw = Random();
//     for (var i = 0; i < 1; i++) {
//       print(rngw.nextInt(10000));
//
// return rngw;
//
//
//
//
//
//
//     }
//   }
  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

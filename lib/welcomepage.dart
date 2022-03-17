import 'package:flutter/material.dart';
import 'package:pubz/cons/constants.dart';
import 'package:pubz/login.dart';
import 'package:pubz/signup.dart';
import 'package:url_launcher/url_launcher.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HWhite,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: HPrimarycolor,
            ),
            onPressed: () {
              setState(() { _makePhoneCall('tel:0597924917'); });
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Text(
                          "W",
                          style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              color: HPrimarycolor,
                              fontSize: size.height * 0.07),
                        ),
                        Text(
                          "elcome",
                          style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.07),
                        ),
                      ],
                    ),
                  ),
                  //2nd line
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Text(
                          "To ",
                          style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.05),
                        ),
                        Text(
                          "E",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HPrimarycolor,
                              fontSize: size.height * 0.05),
                        ),
                        Text(
                          "xample",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.05),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("Wear your Best Moments",
                    style: TextStyle(
                      color: HGrey,
                    ),),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.55,
                child: Image.asset("assets/images/woman.png",)
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 50,
                  child: TextButton(
                      child: Text("LOGIN".toUpperCase(),
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
                                      side: BorderSide(color: HWhite)))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const login()),
                        );
                      }),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Center(
                child: Container(
                  width: 250,
                  height: 50,
                  child: TextButton(
                      child: Text("Signup".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(HPrimarycolor),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(HWhite),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: HPrimarycolor)))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signup()),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'adduser.dart';
import 'cons/constants.dart';

class usersel extends StatefulWidget {
  const usersel({Key? key}) : super(key: key);

  @override
  _userselState createState() => _userselState();
}

class _userselState extends State<usersel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.height * 0.25,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Who is Using now?",
                    style: TextStyle(
                      fontSize: 25,
                      color: HPrimarycolor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * 0.60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: false,
                    childAspectRatio: 0.7 / 0.5,
                    mainAxisSpacing: 7,
                    crossAxisSpacing: 5,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      add(
                        'Kapila',
                      ),
                      add(
                        'Saman',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.40,
              child: Container(
                child: TextButton(
                    child: Text("Add new user".toUpperCase(),
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
                      Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => adduser()), (route) => false);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget add(name) {
    return Container(
      height: 8,
      width: 10,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              name,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              Center(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(


                  stream: FirebaseFirestore.instance
                      .collection('Customer')



                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError)
                      return Text('Error = ${snapshot.error}');

                    if (snapshot.hasData) {
                      final docs = snapshot.data!.docs;
                      return SingleChildScrollView(
                        child: Container(
                          height: 10,
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

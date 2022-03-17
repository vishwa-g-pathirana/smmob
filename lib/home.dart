// import 'package:flutter/material.dart';
//
// import 'cons/constants.dart';
// import 'login.dart';
// import 'menubar.dart';
//
// var scaffoldkey = GlobalKey<ScaffoldState>();
//
// class home extends StatefulWidget {
//   const home({Key? key}) : super(key: key);
//
//   @override
//   _homeState createState() => _homeState();
// }
//
// class _homeState extends State<home> {
//   @override
//   var on = Color(0xFFFFFFFF);
//   var off = Color(0xFF003899);
//   bool val = true;
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       key: scaffoldkey,
//       drawer: menubar(),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Text(
//           'SwapMate',
//           style: TextStyle(
//             color: HPrimarycolor,
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.segment,
//             color: HPrimarycolor,
//           ),
//           onPressed: () {
//             scaffoldkey.currentState!.openDrawer();
//           },
//         ),
//         actions: [
//           PopupMenuButton<String>(
//             icon: Icon(
//               Icons.person_pin_circle_outlined,
//               color: HPrimarycolor,
//             ),
//             onSelected: handleClick,
//             itemBuilder: (BuildContext context) {
//               return {'User 1', 'User 2', 'User 3'}.map((String choice) {
//                 return PopupMenuItem<String>(
//                   value: choice,
//                   child: Text(choice),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//
//             Padding(
//               padding: const EdgeInsets.only(top: 5),
//               child: Container(
//                 height: size.height * 0.06,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 30,
//                         child: TextButton(
//                             child:
//                                 Text("For you", style: TextStyle(fontSize: 14)),
//                             style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                     EdgeInsets.only(left: 10, right: 10)),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(on),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(off),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(50.0),
//                                         side: BorderSide(color: on)))),
//                             onPressed: () {
//                               setState(() {
//                                 on = Color(0xFFFFFFFF);
//                                 off = Color(0xFF003899);
//                                 val = true;
//                               });
//                             }),
//                       ),
//                     ),
//                     Container(
//                       height: size.height * 0.03,
//                       child: VerticalDivider(
//                         color: HGrey,
//                         thickness: 1.5,
//                         width: 20,
//                         indent: 0,
//                         endIndent: 0,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 30,
//                         child: TextButton(
//                             child:
//                                 Text("Shorts", style: TextStyle(fontSize: 14)),
//                             style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                     EdgeInsets.only(left: 10, right: 10)),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(HGrey),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(HWhite),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(50.0),
//                                         side: BorderSide(color: HGrey)))),
//                             onPressed: () {
//                               setState(() {
//                                 off = Color(0xFFFFFFFF);
//                                 on = Color(0xFF003899);
//                                 val = false;
//                               });
//                             }),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 30,
//                         child: TextButton(
//                             child:
//                                 Text("Denim", style: TextStyle(fontSize: 14)),
//                             style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                     EdgeInsets.only(left: 10, right: 10)),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(HGrey),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(HWhite),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(50.0),
//                                         side: BorderSide(color: HGrey)))),
//                             onPressed: () {
//                               setState(() {
//                                 off = Color(0xFFFFFFFF);
//                                 on = Color(0xFF003899);
//                                 val = false;
//                               });
//                             }),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 30,
//                         child: TextButton(
//                             child:
//                                 Text("Accesories", style: TextStyle(fontSize: 14)),
//                             style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                     EdgeInsets.only(left: 10, right: 10)),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(HGrey),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(HWhite),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(50.0),
//                                         side: BorderSide(color: HGrey)))),
//                             onPressed: () {
//                               setState(() {
//                                 off = Color(0xFFFFFFFF);
//                                 on = Color(0xFF003899);
//                                 val = false;
//                               });
//                             }),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 30,
//                         child: TextButton(
//                             child:
//                                 Text("shirt", style: TextStyle(fontSize: 14)),
//                             style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                     EdgeInsets.only(left: 10, right: 10)),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(HGrey),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(HWhite),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(50.0),
//                                         side: BorderSide(color: HGrey)))),
//                             onPressed: () {
//                               setState(() {
//                                 off = Color(0xFFFFFFFF);
//                                 on = Color(0xFF003899);
//                                 val = false;
//                               });
//                             }),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 30,
//                         child: TextButton(
//                             child:
//                                 Text("frock", style: TextStyle(fontSize: 14)),
//                             style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                     EdgeInsets.only(left: 10, right: 10)),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(HGrey),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(HWhite),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(50.0),
//                                         side: BorderSide(color: HGrey)))),
//                             onPressed: () {
//                               setState(() {
//                                 off = Color(0xFFFFFFFF);
//                                 on = Color(0xFF003899);
//                                 val = false;
//                               });
//                             }),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 30,
//                         child: TextButton(
//                             child:
//                                 Text("jacket", style: TextStyle(fontSize: 14)),
//                             style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                     EdgeInsets.only(left: 10, right: 10)),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(HGrey),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(HWhite),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(50.0),
//                                         side: BorderSide(color: HGrey)))),
//                             onPressed: () {
//                               setState(() {
//                                 off = Color(0xFFFFFFFF);
//                                 on = Color(0xFF003899);
//                                 val = false;
//                               });
//                             }),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: size.height * 0.75,
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: false,
//                 childAspectRatio: 1 / 1.5,
//                 mainAxisSpacing: 7,
//                 crossAxisSpacing: 5,
//                 children: [
//                   add(
//                     'Test one',
//                     'https://i.pinimg.com/originals/d6/0c/ae/d60cae213c52ae8111a55da8ff28e5b8.png',
//                   ),
//                   add(
//                     'Test one',
//                     'https://i.pinimg.com/originals/62/98/b0/6298b026a65cf80bcf9dce061e9b79c9.png',
//                   ),
//                   add(
//                     'Test one',
//                     'https://i.pinimg.com/originals/bd/ef/cb/bdefcbc72735f64db17f3250b1e64245.png',
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void handleClick(String value) {
//     switch (value) {
//       case 'user 1':
//         break;
//       case 'User 2':
//         break;
//     }
//   }
//
//   Widget add(
//     name,
//     image,
//   ) {
//     Size size = MediaQuery.of(context).size;
//     var custom = Icons.favorite_border;
//     return Container(
//       height: 10,
//       width: 10,
//       child: GestureDetector(
//         onTap: () {},
//         child: Card(
//           color: HCatBak,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           elevation: 5,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(20),
//                         topLeft: Radius.circular(20),
//                         bottomLeft: Radius.circular(10),
//                         bottomRight: Radius.circular(10)),
//                     image: DecorationImage(
//                       fit: BoxFit.fitWidth,
//                       image: NetworkImage(image),
//                     ),
//                     color: HCatBak,
//                   ),
//                   height: size.height * 0.28,
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 5, top: 3),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 2),
//                             child: Text(
//                               name,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   size: 20,
//                                   color: Colors.white,
//                                 ),
//                                 Text(
//                                   '(4)',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget catogaries() {
//     return GestureDetector(
//       child: CircleAvatar(),
//     );
//   }
// }

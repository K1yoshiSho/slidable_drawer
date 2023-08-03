// import 'package:inner_drawer/inner_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';

// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData(useMaterial3: true),
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: InnerDrawer(
//         drawerBody: CustomDrawer(),
//         // drawerWidth: 250,
//         child: Center(child: Text("wdwd")),
//       ),
//     );
//   }
// }

// class CustomDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue, // can be any color
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'This is a custom drawer',
//             style: TextStyle(color: Colors.white, fontSize: 24),
//           ),
//         ],
//       ),
//     );
//   }
// }

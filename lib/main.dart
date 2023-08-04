import 'package:inner_drawer/inner_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InnerDrawerController innerDrawerController = InnerDrawerController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InnerDrawer(
        drawerBody: CustomDrawer(
          controller: innerDrawerController,
        ),
        // drawerWidth: 250,
        innerDrawerController: innerDrawerController,
        child: Center(
            child: TextButton(
          onPressed: () {
            print('pressed');

            innerDrawerController.animateToOpen();
          },
          child: Text('Open Drawer'),
        )),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final InnerDrawerController controller;

  const CustomDrawer({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // can be any color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              controller.animateToClose();
            },
            child: Text('This is a custom drawer'),
          ),
        ],
      ),
    );
  }
}

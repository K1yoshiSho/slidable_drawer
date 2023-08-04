import 'package:flutter/material.dart';
import 'package:custom_inner_drawer/inner_drawer.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(useMaterial3: true),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              innerDrawerController.animateToOpen();
            },
            child: const Text(
              'Open Drawer',
              style: TextStyle(color: Colors.white),
            ),
          )),
        ),
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
      color: const Color.fromARGB(255, 66, 66, 66), // can be any color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              controller.animateToClose();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

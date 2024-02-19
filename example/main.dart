import 'package:flutter/material.dart';
import 'package:slidable_drawer/slidable_drawer.dart';
import 'package:slidable_drawer/src/utils/swipe_direction.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // Create and return the state associated with MyApp.
  @override
  State<MyApp> createState() => _MyAppState();
}

// The state of the MyApp widget.
class _MyAppState extends State<MyApp> {
  final SlidableDrawerController _slidableDrawer = SlidableDrawerController();

  // initState is called when this object is inserted into the tree.
  @override
  void initState() {
    super.initState();
  }

  // This method builds the widget that this state represents.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidableDrawer(
        swipeDirection: SwipeDirection.rightToLeft,
        drawerBody: _SlidableDraweBody(
          controller: _slidableDrawer,
        ),
        innerDrawerController: _slidableDrawer,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              _slidableDrawer.animateToOpen();
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

class _SlidableDraweBody extends StatelessWidget {
  final SlidableDrawerController controller;

  const _SlidableDraweBody({required this.controller});

  // This method builds the widget that this stateless widget represents.
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

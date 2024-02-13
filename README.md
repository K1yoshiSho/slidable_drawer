<div align="center">
<p align="center">
    <a href="https://github.com/K1yoshiSho/slidable_drawer" align="center">
        <img src="https://github.com/K1yoshiSho/slidable_drawer/blob/main/assets/images/slidable_drawer.png?raw=true" width="400px">
    </a>
</p>
</div>

<h2 align="center"> This package was created to implement a Custom Drawer that could be opened with a simple swipe. 🚀 </h2>

<p align="center">
Included SlidableDrawerController for animated open/close drawer 😊
   <br>
   <span style="font-size: 0.9em"> Show some ❤️ and <a href="https://github.com/K1yoshiSho/slidable_drawer.git">star the repo</a> to support the project! </span>
</p>

<p align="center">
  <a href="https://pub.dev/packages/slidable_drawer"><img src="https://img.shields.io/pub/v/slidable_drawer.svg" alt="Pub"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/K1yoshiSho/slidable_drawer"><img src="https://hits.dwyl.com/K1yoshiSho/slidable_drawer.svg?style=flat" alt="Repository views"></a>
  <a href="https://github.com/K1yoshiSho/slidable_drawer"><img src="https://img.shields.io/github/stars/K1yoshiSho/slidable_drawer?style=social" alt="Pub"></a>
</p>
<p align="center">
  <a href="https://pub.dev/packages/slidable_drawer/score"><img src="https://img.shields.io/pub/likes/slidable_drawer?logo=flutter" alt="Pub likes"></a>
  <a href="https://pub.dev/packages/slidable_drawer/score"><img src="https://img.shields.io/pub/popularity/slidable_drawer?logo=flutter" alt="Pub popularity"></a>
  <a href="https://pub.dev/packages/slidable_drawer/score"><img src="https://img.shields.io/pub/points/slidable_drawer?logo=flutter" alt="Pub points"></a>
</p>

<br>

## 📌 Features

- ✅ Simple open/close drawer with swipe to right
- ✅ Open/close drawer using SlidableDrawerController

## 📌 Getting Started
Follow these steps to use this package

### Add dependency

```yaml
dependencies:
  slidable_drawer: ^1.0.6
```

### Add import package

```dart
import 'package:slidable_drawer/slidable_drawer.dart';
```

### Easy to use
Simple example of use `SlidableDrawer`<br>
Put this code in your project at an screen and learn how it works 😊

<div style="display: flex; flex-direction: row; align-items: flex-start; justify-content: flex-start;">
  <img src="https://github.com/K1yoshiSho/slidable_drawer/blob/main/assets/videos/slidable.gif?raw=true"
  alt="Slidable package's example" width="250" style="margin-right: 10px;"/>
</div>

&nbsp;

Widget part:
```dart
import 'package:flutter/material.dart';
import 'package:slidable_drawer/slidable_drawer.dart';

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
```

<br>
<div align="center" >
  <p>Thanks to all contributors of this package</p>
  <a href="https://github.com/K1yoshiSho/slidable_drawer/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=K1yoshiSho/slidable_drawer" />
  </a>
</div>
<br>
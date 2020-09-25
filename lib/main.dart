import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:magic/magic.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        title: 'Magic',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // backgroundColor: Colors.lightGreenAccent,
          body: Home(),
        ));
  }
}

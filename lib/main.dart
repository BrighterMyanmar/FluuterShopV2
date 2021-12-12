import 'package:flutter/material.dart';
import 'package:shopvtwo/pages/Flash.dart';
import 'package:shopvtwo/pages/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Flash(),
      "/home": (context) => Home()
    },
  ));
}

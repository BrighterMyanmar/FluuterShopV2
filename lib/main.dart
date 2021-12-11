import 'package:flutter/material.dart';
import 'package:shopvtwo/pages/Flash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context) => Flash()
    },
  ));
}

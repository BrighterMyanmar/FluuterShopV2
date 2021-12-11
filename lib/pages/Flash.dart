import 'package:flutter/material.dart';
import 'package:shopvtwo/helpers/TrianglePainter.dart';

class Flash extends StatefulWidget {
  const Flash({Key? key}) : super(key: key);

  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        CustomPaint(
          painter: TrianglePainter(mSize),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Food Monkey",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Title")),
            ),
            SizedBox(height: 60),
            Center(child: Image.asset("assets/images/fm.png")),
            SizedBox(height: 60),
            Center(child: CircularProgressIndicator())
          ],
        )
      ])),
    );
  }
}

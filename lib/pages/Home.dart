import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shopvtwo/utils/Vary.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = ["1.png", "2.png", "3.png", "4.png", "5.png"];
  List<String> categories = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
    "6.png",
    "7.png",
    "8.png",
    "9.png",
    "10.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _makeTitleText("Tags"),
        SizedBox(height: 10),
        Container(
            height: 150,
            child: Swiper(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.asset("assets/images/${images[index]}");
              },
              scale: 0.5,
              viewportFraction: 0.5,
              autoplay: true,
              duration: 1000,
            )),
        SizedBox(height: 10),
        _makeTitleText("Categories"),
        Container(
          height: 500,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) => _makeCategoryAction(index)),
        )
      ])),
    ));
  }

  _makeCategoryAction(index) {
    return Card(
      color: Vary.normal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
            color: Vary.accent,
            child: Center(
              child: Text("Big Burger",
                  style: TextStyle(
                      fontSize: 20, fontFamily: "English", color: Vary.primary)),
            ),
          ),
          SizedBox(height:10),
          Image.asset(
            "assets/images/${categories[index]}",
            width: 120.0,
            height: 120.0,
          )
        ],
      ),
    );
  }

  _makeTitleText(text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Vary.secondary,
            borderRadius: BorderRadius.only(topRight: Radius.circular(60))),
        child: Text(text,
            style: TextStyle(
                fontSize: 40.0,
                color: Vary.normal,
                fontWeight: FontWeight.bold,
                fontFamily: "Title")));
  }
}

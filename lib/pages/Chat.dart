import 'package:flutter/material.dart';
import 'package:shopvtwo/utils/Vary.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var _msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 3) * 2;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Vary.accent,
            brightness: Brightness.dark,
            title: Text("Chat with Customer Service")),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildLeftTextWidget(width),
            _buildRightTextWidget(width),
            _buildLeftImageWidget("assets/images/1.png"),
            _buildRightImageWidget("assets/images/1.png"),
            Container(
              decoration: BoxDecoration(color: Vary.normal),
              child: Row(
                children: [
                  Icon(Icons.file_copy, size: 35, color: Vary.primary),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _msgController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Vary.primary, width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Vary.primary, width: 0.5))),
                    ),
                  )),
                  Icon(Icons.send, size: 35, color: Vary.primary)
                ],
              ),
            )
          ]),
        ));
  }

  _buildRightImageWidget(image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Vary.darkGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(40),
              )),
          child: Image.asset(image, width: 200, height: 150),
        ),
      ],
    );
  }

  _buildRightTextWidget(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: width,
          decoration: BoxDecoration(
              color: Vary.accent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(40),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _makeTitleText("Teski Chan", color: Vary.primary),
              SizedBox(height: 5),
              _makeMessageText(Vary.sampleText),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_makeDateText("2022-01-15")],
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildLeftImageWidget(image) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Vary.darkGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(40),
          )),
      child: Image.asset(image, width: 200, height: 150),
    );
  }

  _buildLeftTextWidget(width) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: width,
      decoration: BoxDecoration(
          color: Vary.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(40),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _makeTitleText("Teski Chan"),
          SizedBox(height: 5),
          _makeMessageText(Vary.sampleText),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_makeDateText("2022-01-15")],
          )
        ],
      ),
    );
  }

  _makeDateText(text, {color: Vary.primary}) {
    return Text(text,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontSize: 16.0,
            color: color,
            fontWeight: FontWeight.bold,
            fontFamily: "Burmese"));
  }

  _makeMessageText(text, {color: Vary.normal}) {
    return Text(text,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontSize: 16.0,
            color: color,
            fontWeight: FontWeight.bold,
            fontFamily: "Burmese"));
  }

  _makeTitleText(text, {color: Vary.darkGrey}) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Title"));
  }
}

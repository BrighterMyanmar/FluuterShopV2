import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopvtwo/models/Message.dart';
import 'package:shopvtwo/utils/Kpo.dart';
import 'package:shopvtwo/utils/Vary.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var _msgController = TextEditingController();
  File? file;
  final ImagePicker _picker = ImagePicker();
  List<Message> chats = [];
  ScrollController _scrollController = ScrollController(initialScrollOffset: 0);

  _emitMessage(msg, type) {
    var sendMsg = new Map();
    sendMsg["from"] = Vary.user?.id;
    sendMsg["to"] = Vary.SHOP_ID;
    sendMsg["type"] = type;
    sendMsg["msg"] = msg;
    Kpo.socket?.emit("message", sendMsg);
  }

  _invokeSocket() {
    Kpo.socket?.emit("load-more", "");
    Kpo.socket?.on("message", (data) {
      print(data);
      Message msg = Message.fromJson(data);
      chats.add(msg);
      setState(() {
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 200,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn);
      });
    });
    Kpo.socket?.on("messages", (data) {
      List lisy = data as List;
      chats = lisy.map((e) => Message.fromJson(e)).toList();
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _invokeSocket();
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 3) * 2;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Vary.accent,
            brightness: Brightness.dark,
            title: Text("Chat with Customer Service")),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    Message msg = chats[index];
                    return msg.from.id == Vary.user?.id
                        ? msg.type == "text"
                            ? _buildLeftTextWidget(width, msg)
                            : _buildLeftImageWidget(msg.msg)
                        : msg.type == "text"
                            ? _buildRightTextWidget(width, msg)
                            : _buildRightImageWidget(msg.msg);
                  })),
          Container(
            decoration: BoxDecoration(color: Vary.normal),
            child: Row(
              children: [
                InkWell(
                    onTap: () => _getImage(),
                    child:
                        Icon(Icons.file_copy, size: 35, color: Vary.primary)),
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
                InkWell(
                    onTap: () {
                      var msg = _msgController.text;
                      _emitMessage(msg, "text");
                    },
                    child: Icon(Icons.send, size: 35, color: Vary.primary))
              ],
            ),
          )
        ]));
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
          child: Image.network(image, width: 200, height: 150),
        ),
      ],
    );
  }

  _buildRightTextWidget(width, Message msg) {
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
              _makeTitleText(msg.from.name, color: Vary.primary),
              SizedBox(height: 5),
              _makeMessageText(msg.msg),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_makeDateText(msg.created.split("T")[0])],
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
      child: Image.network(image, width: 200, height: 150),
    );
  }

  _buildLeftTextWidget(width, Message msg) {
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
          _makeTitleText(msg.from.name),
          SizedBox(height: 5),
          _makeMessageText(msg.msg),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_makeDateText(msg.created.split("T")[0])],
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

  _uploadImage() async {
    var galleryUri = Uri.parse("${Vary.API_URL}/imageupload");
    http.MultipartRequest request =
        new http.MultipartRequest("POST", galleryUri);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath("image", file?.path ?? "");
    request.files.add(multipartFile);
    request.headers["Authorization"] = "Bearer ${Vary.user?.token}";

    await request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((value) {
        var resData = jsonDecode(value);
        _emitMessage(resData["msg"], "image");
      });
    });
  }

  Future _getImage() async {
    final result = await _picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      print("${result.path}");
      file = File(result.path);
      _uploadImage();
    } else {
      Kpo.toast(context, "File Pick Error");
    }
  }
}

import 'dart:convert';

import 'package:shopvtwo/models/Category.dart';
import 'package:shopvtwo/models/Tag.dart';
import 'package:shopvtwo/utils/Vary.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<Category>> getAllCats() async {
    List<Category> cats = [];

    Uri uri = Uri.parse("${Vary.API_URL}/cats");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      List lisy = responseData["result"] as List;
      cats = lisy.map((e) => Category.fromJson(e)).toList();
    } else {
      print(responseData["msg"]);
    }
    return cats;
  }

  static Future<List<Tag>> getAllTags() async {
    List<Tag> tags = [];

    Uri uri = Uri.parse("${Vary.API_URL}/tags");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      List lisy = responseData["result"] as List;
      tags = lisy.map((e) => Tag.fromJson(e)).toList();
    } else {
      print(responseData["msg"]);
    }
    return tags;
  }
}

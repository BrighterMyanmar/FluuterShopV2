import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopvtwo/models/Category.dart';
import 'package:shopvtwo/models/Product.dart';
import 'package:shopvtwo/models/Tag.dart';
import 'package:shopvtwo/models/User.dart';

import 'Vary.dart';

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

  static Future<List<Product>> catProducts({id, page}) async {
    List<Product> products = [];
    Uri uri = Uri.parse("${Vary.API_URL}/catproducts/$id/$page");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      List lisy = responseData["result"] as List;
      products = lisy.map((e) => Product.fromJson(e)).toList();
    } else {
      print(responseData["msg"]);
    }
    return products;
  }

  static Future<List<Product>> tagproduct({id, page}) async {
    List<Product> products = [];
    Uri uri = Uri.parse("${Vary.API_URL}/tagproducts/$id/$page");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      List lisy = responseData["result"] as List;
      products = lisy.map((e) => Product.fromJson(e)).toList();
    } else {
      print(responseData["msg"]);
    }
    return products;
  }

  static Future<bool> register({json}) async {
    Uri uri = Uri.parse("${Vary.API_URL}/register");
    var response = await http.post(uri, body: json, headers: Vary.headers);
    print(response.body);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      Vary.sucMsg = responseData["msg"];
      return true;
    } else {
      Vary.errMsg = responseData["msg"];
      return false;
    }
  }

  static Future<bool> login({json}) async {
    Uri uri = Uri.parse("${Vary.API_URL}/login");
    var response = await http.post(uri,body: json,headers:Vary.headers);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      Vary.user = User.fromJson(responseData["result"]);
      Vary.sucMsg = responseData["msg"];
      return true;
    } else {
      Vary.errMsg = responseData["msg"];
      return false;
    }
  }
}

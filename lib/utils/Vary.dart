import 'package:flutter/material.dart';
import 'package:shopvtwo/models/User.dart';

class Vary {
  static const Color primary = Color(0xFFF6F6F6);
  static const Color secondary = Color(0xFFFFBB91);
  static const Color accent = Color(0xFFFF8E6E);
  static const Color normal = Color(0xFF515070);
  static const Color yellow = Color(0xffFDC054);
  static const Color darkGrey = Color(0xff202020);
  static const String SHOP_ID = "610fd68647b7a33ec0ea5d10";
  static const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
  static const String BASE_URL = "http://13.214.58.126:3000";
  static const String API_URL = "$BASE_URL/api";
  static const String sampleText =
      "သီဟိုဠ်မှ ဉာဏ်ကြီးရှင်သည် အာယုဝဍ္ဎနဆေးညွှန်းစာကို ဇလွန်ဈေးဘေး ဗာဒံပင်ထက် အဓိဋ္ဌာန်လျက် ဂဃနဏဖတ်ခဲ့သည်။";

  static String errMsg = "";
  static String sucMsg = "";

  static User? user;

  static Map<String, String> headers = {"content-type": "application/json"};

  static Map<String, String> tokenHeader = {
    "content-type": "application/json",
    "authorization": "Bearer ${user?.token}"
  };
}

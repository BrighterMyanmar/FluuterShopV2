import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopvtwo/helpers/TrianglePainter.dart';
import 'package:shopvtwo/pages/Register.dart';
import 'package:shopvtwo/utils/Api.dart';
import 'package:shopvtwo/utils/Kpo.dart';
import 'package:shopvtwo/utils/Vary.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formKey = GlobalKey<FormState>();
  var _phoneController = TextEditingController(text: "09123123123");
  var _passwordController = TextEditingController(text: "123123123");
  var _obsecure = true;

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              painter: TrianglePainter(mSize),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Image.asset("assets/images/fm.png"),
                  SizedBox(height: 20),
                  Text("Login",
                      style: TextStyle(
                          color: Vary.normal,
                          fontFamily: "Title",
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Form(
                      key: _formKey,
                      child: Column(children: [
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Phone နံပါတ် ဖြည့်ပါ";
                            }
                            if (v.length < 7) {
                              return "Phone နံပါတ် မှားနေပါ";
                            }
                            return null;
                          },
                          onChanged: (v) {
                            if (v.length < 4) {
                              print("Error");
                            } else {
                              print(v);
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontFamily: "Burmese"),
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone",
                            labelStyle:
                                TextStyle(color: Vary.normal, fontSize: 20.0),
                            enabledBorder: _getBorder(),
                            focusedBorder: _getBorder(),
                          ),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          obscureText: _obsecure,
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Password ဖြည့်ပါ";
                            }
                            if (v.length < 8) {
                              return "Password အနည်းဆုံး ၈ လုံး";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: () {
                                _obsecure = !_obsecure;
                                setState(() {});
                              },
                              child: _obsecure
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            labelText: "Password",
                            labelStyle:
                                TextStyle(color: Vary.normal, fontSize: 20.0),
                            enabledBorder: _getBorder(),
                            focusedBorder: _getBorder(),
                          ),
                        ),
                      ])),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register())),
                            child: Text("Now a member yet!\nRegister Here!",
                                style: TextStyle(
                                    color: Vary.normal,
                                    fontFamily: "Title",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 5),
                          Container(width: 100, height: 5, color: Vary.accent)
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var json = jsonEncode({
                                    "phone": _phoneController.text,
                                    "password": _passwordController.text
                                  });
                                  bool bol = await Api.login(json: json);
                                  if (bol) {
                                    print(Vary.user?.id);
                                    Kpo.getSocket();
                                    Navigator.pop(context);
                                  } else {
                                    Kpo.toast(context, Vary.errMsg);
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Vary.accent,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.lock, color: Vary.primary),
                                  SizedBox(width: 10),
                                  Text("login",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Vary.primary))
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  _getBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Vary.normal, width: 0.4),
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }
}

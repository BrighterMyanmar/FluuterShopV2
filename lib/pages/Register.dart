import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shopvtwo/helpers/TrianglePainter.dart';
import 'package:shopvtwo/utils/Api.dart';
import 'package:shopvtwo/utils/Kpo.dart';
import 'package:shopvtwo/utils/Vary.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();
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
                  SizedBox(height: 20),
                  Image.asset("assets/images/fm.png"),
                  SizedBox(height: 20),
                  Text("Register",
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
                          controller: _nameController,
                          keyboardType: TextInputType.phone,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "နာမည် ဖြည့်ပါ";
                            }
                            if (v.length < 4) {
                              return "နာမည် အပြည့်အစုံဖြည့်ပါ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Name",
                            labelStyle:
                                TextStyle(color: Vary.normal, fontSize: 20.0),
                            enabledBorder: _getBorder(),
                            focusedBorder: _getBorder(),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.phone,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Email ဖြည့်ပါ";
                            }
                            if (v.length < 14) {
                              return "Email အပြည့်အစုံဖြည့်ပါ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                            labelStyle:
                                TextStyle(color: Vary.normal, fontSize: 20.0),
                            enabledBorder: _getBorder(),
                            focusedBorder: _getBorder(),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _phoneController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Phone နံပါတ် ဖြည့်ပါ";
                            }
                            if (v.length < 7) {
                              return "Phone နံပါတ် မှားနေပါ";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone",
                            labelStyle:
                                TextStyle(color: Vary.normal, fontSize: 20.0),
                            enabledBorder: _getBorder(),
                            focusedBorder: _getBorder(),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          obscureText: _obsecure,
                          controller: _passwordController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Password ဖြည့်ပါ";
                            }
                            if (v.length < 8) {
                              return "Password အနည်းဆုံး ၈ လုံး";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
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
                            onTap: () => Navigator.pop(context),
                            child: Text("Already a member!\nLogin Here!",
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
                                    "name": _nameController.text,
                                    "email": _emailController.text,
                                    "phone": _phoneController.text,
                                    "password": _passwordController.text
                                  });
                                  bool bol = await Api.register(json: json);
                                  if (bol) {
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
                                  Text("Register",
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

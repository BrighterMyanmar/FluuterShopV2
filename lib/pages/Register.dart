import 'package:flutter/material.dart';
import 'package:shopvtwo/helpers/TrianglePainter.dart';
import 'package:shopvtwo/utils/Vary.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  var _nameController = TextEditingController();
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
                          controller: _phoneController,
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
                              onPressed: () {},
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

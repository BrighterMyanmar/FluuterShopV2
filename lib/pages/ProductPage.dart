import 'package:flutter/material.dart';
import 'package:shopvtwo/utils/Api.dart';

class ProductPage extends StatefulWidget {
  final String id, type;

  const ProductPage({Key? key, required this.id, required this.type})
      : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState(this.id, this.type);
}

class _ProductPageState extends State<ProductPage> {
  String id, type;

  _ProductPageState(this.id, this.type);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Products")),
        body: Column(
          children: [Text(id), Text(type)],
        ));
  }
}

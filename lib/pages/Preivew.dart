import 'package:flutter/material.dart';
import 'package:shopvtwo/models/Product.dart';

class Preview extends StatefulWidget {
  final Product product;

  const Preview({Key? key, required this.product}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState(this.product);
}

class _PreviewState extends State<Preview> {
  Product product;

  _PreviewState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview")),
      body: Column(children: [
          Text(product.name,style:TextStyle(fontSize: 40.0))
      ],));
  }
}

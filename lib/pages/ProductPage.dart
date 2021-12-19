import 'package:flutter/material.dart';
import 'package:shopvtwo/models/Product.dart';
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
  int page = 1;

  _ProductPageState(this.id, this.type);

  List<Product> products = [];

  _loadProducts() async {
    List<Product> pros = await Api.getPagiProducts(id: id, page: page);
    print(pros.length);
  }

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Products")),
        body: Column(
          children: [Text(id), Text(type)],
        ));
  }
}

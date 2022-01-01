import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopvtwo/models/Product.dart';
import 'package:shopvtwo/models/Tag.dart';
import 'package:shopvtwo/pages/Preivew.dart';
import 'package:shopvtwo/utils/Api.dart';
import 'package:shopvtwo/utils/Kpo.dart';
import 'package:shopvtwo/utils/Vary.dart';

class ProductPage extends StatefulWidget {
  final String id, type;
  final List<Tag> tags;

  const ProductPage(
      {Key? key, required this.id, required this.type, required this.tags})
      : super(key: key);

  @override
  _ProductPageState createState() =>
      _ProductPageState(this.id, this.type, this.tags);
}

class _ProductPageState extends State<ProductPage> {
  String id, type;
  List<Tag> tags;
  int page = 1;
  var _currentIndex = 0;
  var _isLoading = false;

  _ProductPageState(this.id, this.type, this.tags);

  List<Product> products = [];

  _loadProducts() async {
    setState(() {
      _isLoading = true;
    });
    if (type == "cat") {
      List<Product> pros = await Api.catProducts(id: id, page: page);
      products.addAll(pros);
    } else {
      List<Product> pros = await Api.tagproduct(id: id, page: page);
      products.addAll(pros);
    }

    page = page + 1;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.pinkAccent,
          // brightness: Brightness.dark,
          // elevation: 1,
          title: Text("Products"),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Kpo.getShoppingCart(context),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildCustomNav(),
                Expanded(
                    child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!_isLoading &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      _loadProducts();
                    }
                    return false;
                  },
                  child: _buildGridView(),
                )),
                Container(
                  child: _isLoading ? CircularProgressIndicator() : null,
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildCustomNav() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            var tag = tags[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  _currentIndex = index;
                  type = "tag";
                  setState(() {
                    _loadProducts();
                  });
                  setState(() {});
                },
                child: Column(children: [
                  Text(tag.name,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Vary.normal,
                          fontFamily: "Title")),
                  SizedBox(height: 5),
                  Container(
                    height: 5,
                    width: 70,
                    color: index == _currentIndex
                        ? Vary.accent
                        : Colors.transparent,
                    child: Text(""),
                  )
                ]),
              ),
            );
          }),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemBuilder: (context, index) => _buildProduct(products[index]));
  }

  Widget _buildProduct(Product product) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(product.name,
                style: TextStyle(
                    color: Vary.normal,
                    fontSize: 20.0,
                    fontFamily: "Title",
                    fontWeight: FontWeight.bold)),
          ),
          Image.network(product.images[0], width: 160, height: 120),
          SizedBox(height: 2),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              onTap: () {
                Kpo.addToCart(product);
                setState(() {});
              },
              child: Icon(
                Icons.shopping_cart,
                color: Vary.accent,
                size: 32,
              ),
            ),
            Text("${product.price} Ks",
                style: TextStyle(
                    fontFamily: "Title",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Preview(
                                product: product,
                              )));
                },
                child: Icon(Icons.remove_red_eye, color: Vary.accent, size: 32))
          ])
        ],
      ),
    );
  }
}

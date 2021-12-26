import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopvtwo/models/Product.dart';
import 'package:shopvtwo/utils/Vary.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState(this.product);
}

class _ProductDetailState extends State<ProductDetail> {
  Product product;

  _ProductDetailState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text("Product Detail"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(children: [
              Container(
                  height: 150,
                  child: Swiper(
                    itemCount: product.images.length - 1,
                    itemBuilder: (context, index) {
                      return Image.network(product.images[index]);
                    },
                    scale: 0.5,
                    viewportFraction: 0.5,
                    autoplay: true,
                    duration: 1000,
                  )),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  product.name,
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Title",
                      color: Vary.normal),
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 50.0,
                      color: Vary.accent,
                    ),
                    Positioned(
                      right: -5,
                      top: -10,
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Vary.normal,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Center(
                              child: Text("19",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)))),
                    )
                  ],
                ),
              ]),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _makeRichText("Price", "\t\t\t\t\t\t5000 Ks"),
                  _makeRichText("Size", "\t\t\t\t\t\tLarge Size"),
                  _makeRichText("Promo", "\t\t\t\t\t\tCoca Cola"),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(product.desc,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: "Burmese",
                        fontSize: 18.0,
                        color: Vary.normal)),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Table(
                  border: TableBorder.all(color: Vary.normal),
                  children: [
                    TableRow(children: [
                      _makeTableTitle("Feature"),
                      _makeTableTitle("Value"),
                    ]),
                    ...List.generate(product.features.length, (index) {
                      var feature = product.features[index];
                      var key = feature.keys.toList()[0];
                      return TableRow(children: [
                        _makeTableData(key),
                        _makeTableData(feature[key]),
                      ]);
                    })
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(product.detail,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: "Burmese",
                        fontSize: 18.0,
                        color: Vary.normal)),
              ),
            ]),
          ),
        ));
  }

  _makeTableData(text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(text,
            style: TextStyle(
                color: Vary.normal, fontFamily: "Burmese", fontSize: 18.0)),
      ),
    );
  }

  _makeTableTitle(text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,
            style: TextStyle(
                fontFamily: "Title", fontSize: 25, color: Vary.accent)),
      ),
    );
  }

  _makeRichText(text1, text2) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$text1\n",
          style: TextStyle(
              fontSize: 35.0, fontFamily: "Title", color: Vary.accent)),
      TextSpan(
          text: "$text2",
          style: TextStyle(
              color: Vary.normal, fontSize: 18.0, fontFamily: "Title"))
    ]));
  }
}

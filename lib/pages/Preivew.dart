import 'package:flutter/material.dart';
import 'package:shopvtwo/helpers/ArchPainter.dart';
import 'package:shopvtwo/models/Product.dart';
import 'package:shopvtwo/pages/ProductDetail.dart';
import 'package:shopvtwo/utils/Kpo.dart';
import 'package:shopvtwo/utils/Vary.dart';

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
    var msize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Preview"),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Kpo.getShoppingCart(context),
            )
          ],
        ),
        body: Stack(
          children: [
            CustomPaint(
              painter: ArchPainter(msize),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: TextStyle(
                          fontSize: 45.0,
                          fontFamily: "Title",
                          fontWeight: FontWeight.bold,
                          color: Vary.normal)),
                  SizedBox(height: 20),
                  Center(
                      child: Image.network(
                    product.images[0],
                    width: 300,
                    height: 200,
                  )),
                  SizedBox(height: 25),
                  _makeRichText("Price", "\t\t\t\t\t\t\t\t3500 Ks"),
                  SizedBox(height: 25),
                  _makeRichText("Size", "\t\t\t\t\t\t\t\t Large Size"),
                  SizedBox(height: 25),
                  _makeRichText("Promo", "\t\t\t\t\t\t\t\t Coca Cola"),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            Kpo.addToCart(product);
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text("Buy Now",
                                  style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 25.0,
                                      color: Colors.white))
                            ],
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Vary.normal,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetail(product: product)));
                          },
                          child: Text("Detail",
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontSize: 25.0,
                                  color: Colors.white)),
                          style: TextButton.styleFrom(
                              backgroundColor: Vary.normal,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 17),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)))))
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  _makeRichText(text1, text2) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$text1\n",
          style: TextStyle(fontSize: 45.0, fontFamily: "Title")),
      TextSpan(
          text: "$text2",
          style: TextStyle(
              color: Vary.normal, fontSize: 20.0, fontFamily: "Title"))
    ]));
  }
}

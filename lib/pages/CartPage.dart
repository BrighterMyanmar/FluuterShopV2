import 'package:flutter/material.dart';
import 'package:shopvtwo/models/Product.dart';
import 'package:shopvtwo/pages/Login.dart';
import 'package:shopvtwo/utils/Kpo.dart';
import 'package:shopvtwo/utils/Vary.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Cart", style: TextStyle(fontSize: 30.0)),
          centerTitle: true,
        ),
        body: Column(children: [
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemCount: Kpo.cartProducts.length,
            itemBuilder: (context, index) =>
                _buildCard(Kpo.cartProducts[index]),
          )),
          _buildContainer()
        ]));
  }

  _buildCard(Product product) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Card(
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  width: 70,
                  height: 90,
                ),
                Expanded(
                  child: Column(children: [
                    Text(product.name,
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 30.0,
                            color: Vary.normal,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Price ${product.price}",
                                style: TextStyle(
                                    fontFamily: "English",
                                    fontWeight: FontWeight.bold,
                                    color: Vary.normal)),
                            Text("Total ${product.price * product.count}",
                                style: TextStyle(
                                    fontFamily: "English",
                                    fontWeight: FontWeight.bold,
                                    color: Vary.normal)),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Kpo.reduceProduct(product);
                                setState(() {});
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Vary.normal,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                                child: Icon(Icons.remove, color: Vary.primary),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("${product.count}".padLeft(2, "0"),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Vary.normal)),
                            ),
                            InkWell(
                              onTap: () {
                                Kpo.addToCart(product);
                                setState(() {});
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Vary.normal,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                                child: Icon(Icons.add, color: Vary.primary),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: -5,
          child: InkWell(
            onTap: () {
              Kpo.removeProduct(product);
              setState(() {});
            },
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Vary.accent,
                  borderRadius: BorderRadius.all(Radius.circular(13))),
              child: Icon(
                Icons.close,
                color: Vary.primary,
                size: 16,
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildContainer() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Vary.accent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("SubTotal",
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Vary.primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Title")),
              Text("${Kpo.getProductTotal()} Ks",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Vary.darkGrey,
                      fontFamily: "Title"))
            ],
          ),
          SizedBox(height: 20),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: Vary.normal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              child: Text("Order Now",
                  style: TextStyle(
                      color: Vary.primary,
                      fontFamily: "Title",
                      fontSize: 30.0)))
        ],
      ),
    );
  }
}

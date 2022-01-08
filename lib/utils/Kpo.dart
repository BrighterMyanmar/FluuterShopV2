import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shopvtwo/models/Product.dart';
import 'package:shopvtwo/pages/CartPage.dart';
import 'package:shopvtwo/utils/Vary.dart';

class Kpo {
  static List<Product> cartProducts = [];

  static Widget getShoppingCart(context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartPage()));
      },
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 40.0,
            color: Vary.accent,
          ),
          Positioned(
            right: -5,
            top: -10,
            child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Vary.normal,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                    child: Text("${cartProducts.length}".padLeft(2, "0"),
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))),
          )
        ],
      ),
    );
  }

  static addToCart(product) {
    bool exist = false;
    if (cartProducts.length > 0) {
      cartProducts.forEach((prod) {
        if (prod.id == product.id) {
          exist = true;
          prod.count++;
        }
      });
      if (!exist) {
        cartProducts.add(product);
      }
    } else {
      cartProducts.add(product);
    }
  }

  static reduceProduct(product) {
    cartProducts.forEach((prod) {
      if (prod.id == product.id) {
        if (prod.count > 1) {
          prod.count--;
        }
      }
    });
  }

  static removeProduct(product) {
    product.count = 1;
    cartProducts.removeWhere((prod) => prod.id == product.id);
  }

  static int getProductTotal() {
    int total = 0;
    cartProducts.forEach((prod) {
      total += prod.count * prod.price;
    });
    return total;
  }

  static toast(context, text) {
    showToast(text,
        context: context,
        backgroundColor: Vary.normal,
        textStyle: TextStyle(fontFamily: "Burmese", color: Vary.primary),
        position: StyledToastPosition.center,
        animation: StyledToastAnimation.scale);
  }
}

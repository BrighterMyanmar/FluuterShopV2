import 'package:shopvtwo/models/Tag.dart';

class Product {
  List<dynamic> images;
  List<dynamic> features;
  List<dynamic> colors;
  List<Delivery> deliveries;
  List<Warranty> warranties;
  Cat category;
  SCat subcat;
  CCat childcat;
  Tag tag;
  int discount, price;
  double rating;
  bool status;
  String id, name, brand, size, desc, detail, created;

  Product(
      {required this.images,
      required this.discount,
      required this.features,
      required this.status,
      required this.deliveries,
      required this.warranties,
      required this.colors,
      required this.id,
      required this.name,
      required this.brand,
      required this.size,
      required this.desc,
      required this.detail,
      required this.created,
      required this.price,
      required this.rating,
      required this.category,
      required this.subcat,
      required this.childcat,
      required this.tag});

  factory Product.fromJson(dynamic json) {
    List<dynamic> images = json["images"] as List;
    List<dynamic> features = json["features"] as List;
    List<dynamic> colors = json["colors"] as List;
    List lisy = json["delivery"] as List;
    List<Delivery> deliveries = lisy.map((e) => Delivery.fromJson(e)).toList();

    List warList = json["warranty"] as List;
    List<Warranty> warranties =
        warList.map((e) => Warranty.fromJson(e)).toList();
    Cat category = Cat.fromJson(json["cat"]);
    SCat subcat = SCat.fromJson(json["subcat"]);
    CCat childcat = CCat.fromJson(json["childcat"]);
    Tag tag = Tag.fromJson(json["tag"]);
    return Product(
        images: images,
        discount: json["discount"],
        features: features,
        status: json["status"],
        deliveries: deliveries,
        warranties: warranties,
        colors: colors,
        id: json["_id"],
        name: json["name"],
        brand: json["brand"],
        size: json["size"],
        desc: json["desc"],
        detail: json["detail"],
        created: json["created"],
        price: json["price"],
        rating: json["rating"],
        category: category,
        subcat: subcat,
        childcat: childcat,
        tag: tag);
  }
}

class Delivery {
  List<dynamic> remarks;
  String id, name, duration, image;
  int price;

  Delivery(
      {required this.remarks,
      required this.id,
      required this.name,
      required this.duration,
      required this.image,
      required this.price});

  factory Delivery.fromJson(dynamic json) {
    List<dynamic> remarks = json["remarks"] as List;
    return Delivery(
      remarks: remarks,
      id: json["_id"],
      name: json["name"],
      duration: json["duration"],
      image: json["image"],
      price: json["price"],
    );
  }
}

class Warranty {
  List<dynamic> remarks;
  String id, name, image;

  Warranty(
      {required this.remarks,
      required this.id,
      required this.name,
      required this.image});

  factory Warranty.fromJson(dynamic json) {
    List<dynamic> remarks = json["remark"] as List;
    return Warranty(
        remarks: remarks,
        id: json["_id"],
        name: json["name"],
        image: json["image"]);
  }
}

class Cat {
  List<dynamic> subcats;
  String id, name, image, created;

  Cat(
      {required this.subcats,
      required this.id,
      required this.name,
      required this.image,
      required this.created});

  factory Cat.fromJson(dynamic json) {
    List<dynamic> subcats = json["subcats"] as List;
    return Cat(
        subcats: subcats,
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        created: json["created"]);
  }
}

class SCat {
  List<dynamic> childcats;
  String id, name, image, catid, created;

  SCat(
      {required this.childcats,
      required this.id,
      required this.name,
      required this.image,
      required this.catid,
      required this.created});

  factory SCat.fromJson(dynamic json) {
    List<dynamic> childcats = json["childcats"] as List;
    return SCat(
      childcats: childcats,
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      catid: json["catid"],
      created: json["created"],
    );
  }
}

class CCat {
  String id, name, image, subcatid, created;

  CCat(
      {required this.id,
      required this.name,
      required this.image,
      required this.subcatid,
      required this.created});

  factory CCat.fromJson(dynamic json) {
    return CCat(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      subcatid: json["subcatid"],
      created: json["created"],
    );
  }
}

// class Tagy {
//   String id, name, image, created;
//
//   Tagy(
//       {required this.id,
//       required this.name,
//       required this.image,
//       required this.created});
//
//   factory Tagy.fromJson(dynamic json) {
//     return Tagy(
//       id: json["_id"],
//       name: json["name"],
//       image: json["image"],
//       created: json["created"],
//     );
//   }
// }
/*
 "features": [
                {
                    "အရောင်": "အနီ အဖြူ"
                },
                {
                    "အလေးချိန်": "350 gram"
                },
                {
                    "အသား": "ပိုးကတီပါ"
                },
                {
                    "ထုတ်ပိုးမှူ": "ကော် ပလက်စတစ်"
                },
                {
                    "ဖိနှိပ်ခံနိုင်မှူ": "450 PPM"
                }
            ],
 */

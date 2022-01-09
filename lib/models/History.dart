class History {
  bool status;
  List<Item> items;
  dynamic id, count, user, total, created;

  History(
      {required this.status,
      required this.items,
      required this.id,
      required this.count,
      required this.user,
      required this.total,
      required this.created});

  factory History.fromJson(dynamic json) {
    List lisy = json["items"] as List;
    List<Item> items = lisy.map((e) => Item.fromJson(e)).toList();
    return History(
        status: json["status"],
        id: json["_id"],
        count: json["count"],
        user: json["user"],
        total: json["total"],
        created: json["created"],
        items: items);
  }
}

class Item {
  List<dynamic> images;
  dynamic discount, id, count, productId, name, price, created;
  bool status;

  Item(
      {required this.images,
      required this.discount,
      required this.status,
      required this.id,
      required this.count,
      required this.productId,
      required this.name,
      required this.price,
      required this.created});

  factory Item.fromJson(dynamic json) {
    List<dynamic> images = json["images"] as List;
    return Item(
        images: images,
        discount: json["discount"],
        status: json["status"],
        id: json["_id"],
        count: json["count"],
        productId: json["productId"],
        name: json["name"],
        price: json["price"],
        created: json["created"]);
  }
}
/*
   {
            "items": [
                {
                    "images": [
                        "https://picsum.photos/300/250",
                        "https://picsum.photos/300/250",
                        "https://picsum.photos/300/250"
                    ],
                    "discount": 100,
                    "status": false,
                    "_id": "61ab7f06591a66a60d637e2b",
                    "order": "61ab7f05591a66a60d637e24",
                    "count": 3,
                    "productId": "616264a4d246e49ffe65fe06",
                    "name": "Product9",
                    "price": 1324,
                    "created": "2021-12-04T14:45:26.004Z",
                    "__v": 0
                },
                {
                    "images": [
                        "https://picsum.photos/300/250",
                        "https://picsum.photos/300/250",
                        "https://picsum.photos/300/250"
                    ],
                    "discount": 100,
                    "status": false,
                    "_id": "61ab7f06591a66a60d637e2f",
                    "order": "61ab7f05591a66a60d637e24",
                    "count": 1,
                    "productId": "616264a4d246e49ffe65fe08",
                    "name": "Product11",
                    "price": 5666,
                    "created": "2021-12-04T14:45:26.009Z",
                    "__v": 0
                }
            ],

        }
 */

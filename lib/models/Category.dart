class Category {
  String id, name, image, created;
  List<Subcat> subcats;

  Category(
      {required this.id,
      required this.name,
      required this.image,
      required this.created,
      required this.subcats});

  factory Category.fromJson(dynamic json) {
    List subList = json["subcats"] as List;
    List<Subcat> subcats = subList.map((e) => Subcat.fromJson(e)).toList();
    return Category(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        created: json["created"],
        subcats: subcats);
  }
}

class Subcat {
  String id, name, image, catid, created;
  List<Childcat> childcats;

  Subcat(
      {required this.id,
      required this.name,
      required this.image,
      required this.catid,
      required this.created,
      required this.childcats});

  factory Subcat.fromJson(dynamic json) {
    List childList = json["childcats"] as List;
    List<Childcat> childcats =
        childList.map((e) => Childcat.fromJson(e)).toList();
    return Subcat(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        catid: json["catid"],
        created: json["created"],
        childcats: childcats);
  }
}

class Childcat {
  String id, name, image, subcatid, created;

  Childcat(
      {required this.id,
      required this.name,
      required this.image,
      required this.subcatid,
      required this.created});

  factory Childcat.fromJson(dynamic json) {
    return Childcat(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        subcatid: json["subcatid"],
        created: json["created"]);
  }
}

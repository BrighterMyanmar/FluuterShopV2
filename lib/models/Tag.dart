class Tag {
  String id, name, image, create;

  Tag(
      {required this.id,
      required this.name,
      required this.image,
      required this.create});

  factory Tag.fromJson(dynamic json) {
    return Tag(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        create: json["created"]);
  }
}

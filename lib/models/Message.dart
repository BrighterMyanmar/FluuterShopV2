class Message {
  MsgUser from, to;
  dynamic type, msg, created;

  Message(
      {required this.from,
      required this.to,
      required this.type,
      required this.msg,
      required this.created});

  factory Message.fromJson(dynamic json) {
    MsgUser from = MsgUser.fromJson(json["from"]);
    MsgUser to = MsgUser.fromJson(json["to"]);
    return Message(
        from: from,
        to: to,
        type: json["type"],
        msg: json["msg"],
        created: json["created"]);
  }
}

class MsgUser {
  dynamic id, name;

  MsgUser({required this.id, required this.name});

  factory MsgUser.fromJson(dynamic json) {
    return MsgUser(
      id: json["_id"],
      name: json["name"],
    );
  }
}

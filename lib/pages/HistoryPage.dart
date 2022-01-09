import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopvtwo/models/History.dart';
import 'package:shopvtwo/utils/Api.dart';
import 'package:shopvtwo/utils/Vary.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<History> histories = [];

  _loadHistory() async {
    histories = await Api.getHistory();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Purchase History")),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: histories.length,
                  itemBuilder: (context, index) =>
                      _buildOrder(histories[index])))
        ],
      ),
    );
  }

  _buildOrder(History history) {
    return Container(
      color: Vary.normal,
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${history.created.split("T")[0]}",
                style: TextStyle(color: Vary.primary)),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(backgroundColor: Vary.accent),
                child: Text("${history.total}",
                    style: TextStyle(color: Vary.primary)))
          ],
        ),
        children: [
          ...List.generate(history.items.length,
              (index) => _buildOrderItem(history.items[index]))
        ],
      ),
    );
  }

  _buildOrderItem(Item item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        color: Vary.accent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.network(item.images[0], width: 100, height: 50),
            Column(children: [
              Text("${item.name}",
                  style: TextStyle(
                      fontFamily: "Title",
                      fontSize: 20.0,
                      color: Vary.primary)),
              Text("${item.count} * ${item.price}",
                  style: TextStyle(
                      fontFamily: "Title",
                      fontSize: 16.0,
                      color: Vary.primary)),
            ]),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(backgroundColor: Vary.normal),
                child: Text("${item.count * item.price}",
                    style: TextStyle(color: Vary.primary)))
          ]),
        ),
      ),
    );
  }
}

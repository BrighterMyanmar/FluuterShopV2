import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shopvtwo/models/Category.dart';
import 'package:shopvtwo/models/Tag.dart';
import 'package:shopvtwo/pages/ProductPage.dart';
import 'package:shopvtwo/utils/Api.dart';
import 'package:shopvtwo/utils/Vary.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tag> tags = [];
  List<Category> categories = [];

  var _isLoading = true;

  _loadCategories() async {
    categories = await Api.getAllCats();
    tags = await Api.getAllTags();
    if (categories.length > 0 && tags.length > 0) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: _isLoading
              ? CircularProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      _makeTitleText("Tags"),
                      SizedBox(height: 10),
                      Container(
                          height: 150,
                          child: Swiper(
                            itemCount: tags.length - 1,
                            itemBuilder: (context, index) {
                              return Image.network(tags[index].image);
                            },
                            scale: 0.5,
                            viewportFraction: 0.5,
                            autoplay: true,
                            duration: 1000,
                          )),
                      SizedBox(height: 10),
                      _makeTitleText("Categories"),
                      Container(
                        height: 500,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: categories.length,
                            physics: ScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) =>
                                _makeCategoryAction(categories[index])),
                      )
                    ])),
    ));
  }

  _makeCategoryAction(Category category) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductPage(id: category.id, type: "cat")));
      },
      child: Card(
        color: Vary.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              color: Vary.accent,
              child: Center(
                child: Text(category.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "English",
                        color: Vary.primary)),
              ),
            ),
            SizedBox(height: 10),
            Image.network(
              category.image,
              width: 120.0,
              height: 120.0,
            )
          ],
        ),
      ),
    );
  }

  _makeTitleText(text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Vary.secondary,
            borderRadius: BorderRadius.only(topRight: Radius.circular(60))),
        child: Text(text,
            style: TextStyle(
                fontSize: 40.0,
                color: Vary.normal,
                fontWeight: FontWeight.bold,
                fontFamily: "Title")));
  }
}

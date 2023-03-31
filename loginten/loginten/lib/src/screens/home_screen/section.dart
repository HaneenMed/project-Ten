import 'package:flutter/material.dart';
import 'package:loginten/src/styles/colors_app.dart';

class sectionPage extends StatelessWidget {
  const sectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;

    final List categories = [
      'Graphics & Design',
      'Digital Marketing',
      'Writing & Translation',
      'Video & Animation',
      'Music & Audio',
      'Programming & Tech',
      'Business',
      'Lifestyle',
      'Graphics & Design',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.background900,
        toolbarHeight: 70,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Graphic sections',
              style: TextStyle(
                color: ColorsApp.primary700,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(left: 20,top: 10),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryItem(
            title: categories[index],
            //imagePath: photos[index]['imagePath'] ?? '', // Add default value in case imagePath is null
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  //final String imagePath;

  CategoryItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 50,
        padding: EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            SizedBox(width: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
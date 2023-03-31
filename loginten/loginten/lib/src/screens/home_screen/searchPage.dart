import 'package:flutter/material.dart';
import 'package:loginten/src/screens/home_screen/section.dart';
import 'package:loginten/src/styles/colors_app.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

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
    ];
    final List photos = [
    {'imagePath': 'assets/images/graphic.png'},
    {'imagePath': 'assets/images/markiting.png'},
    {'imagePath': 'assets/images/writing.png'},
    {'imagePath': 'assets/images/video.png'},
    {'imagePath': 'assets/images/voice.png'},
    {'imagePath': 'assets/images/programing.png'},
    {'imagePath': 'assets/images/bussines.png'},
    {'imagePath': 'assets/images/lifestyle.png'},
    // Add more photos here
    ];
    return Scaffold(
    appBar: AppBar(
      backgroundColor: ColorsApp.white,
      toolbarHeight: 70,
        title: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
        'Categories',
        style: TextStyle(
        color: ColorsApp.headlines,
        fontSize: 22,
          ),
        ),
        ),
        ),
    ),
    body: ListView.builder(
    padding: EdgeInsets.only(left: 20,top: 0),
    itemCount: categories.length,
    itemBuilder: (BuildContext context, int index) {
    return CategoryItem(
    title: categories[index],
    imagePath: photos[index]['imagePath'] ?? '', // Add default value in case imagePath is null
    );
    },
    ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  CategoryItem({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(15),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sectionPage(), // Replace with your desired page
                  ),
                );
              },
              child:Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
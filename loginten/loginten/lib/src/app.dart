import 'package:flutter/material.dart';
import 'package:loginten/src/screens/chat.dart';
import 'package:loginten/src/screens/home_screen.dart';
import 'package:loginten/src/screens/home_screen/searchPage.dart';
import 'package:loginten/src/screens/home_screen/section.dart';
import 'package:loginten/src/screens/profilePage.dart';
import 'package:loginten/src/styles/themes_app.dart';

import '../main.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.lightTheme,
      darkTheme: ThemesApp.darkTheme,
      home: const HomeScreen(),
     // home: MyHomePage(),

    );
  }
}


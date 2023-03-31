import 'package:flutter/material.dart';
import 'package:loginten/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginten/src/screens/chat.dart';
import 'package:loginten/src/screens/home_screen.dart';
import 'package:loginten/src/screens/home_screen/protofolio.dart';
import 'package:loginten/src/screens/home_screen/searchPage.dart';
import 'package:loginten/src/screens/profilePage.dart';
import 'package:loginten/src/styles/colors_app.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
       home: LogInScreen(),
     // home: protofolio(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  int _selectedIndex = 0;

  final List _pages = [
    HomeScreen(),
    ChatScreen(),
    CategoriesPage(),
    ProfilePage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: ColorsApp.primary700,),
            label: 'Home',
            backgroundColor: ColorsApp.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outlined, color: ColorsApp.primary700,),
            label: 'Chat',
            backgroundColor: ColorsApp.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: ColorsApp.primary700,),
            label: 'Search',
            backgroundColor: ColorsApp.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: ColorsApp.primary700,),
            label: 'Account',
            backgroundColor: ColorsApp.white,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

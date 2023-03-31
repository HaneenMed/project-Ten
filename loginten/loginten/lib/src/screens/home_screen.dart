import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:loginten/src/screens/detail_screen/adverDetails.dart';
import 'package:loginten/src/screens/home_screen/services.dart';
import 'package:loginten/src/screens/home_screen/widgets/bottom_navigation_item_widget.dart';
import 'package:loginten/src/screens/home_screen/widgets/category_button_widget.dart';
import 'package:loginten/src/screens/home_screen/widgets/pinned_job_card_widget.dart';
import 'package:loginten/src/screens/home_screen/widgets/recent_job_card_widget.dart';
import 'package:loginten/src/styles/colors_app.dart';
import 'package:loginten/src/screens/detail_screen/detail_screen.dart';
import 'home_screen/advertisment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:ColorsApp.background900 ,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
        //  app bar section
          SliverAppBar(
            toolbarHeight: 64,
            backgroundColor: ColorsApp.background900,
            pinned: true,
            title: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  Text("Home",   style: TextStyle(
                    fontSize: 22,
                    color: ColorsApp.headlines ,),
                  ),
                  Spacer(),
                  HeroIcon(
                    HeroIcons.bars3,
                    size: 30,
                    color: ColorsApp.primary700,
                  ),
                ],
              ),
            ),
          ),

          // headline section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.primary700,
                        ),
                      ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => services(), // Replace with your desired page
                          ),
                        );
                      },
                      child: const Text(
                        "Show all",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.gray500,
                        ),
                      ),
                    ),]
              ),
            ),

          ),
          // pinned job section
          SliverToBoxAdapter(
            child: Container(
              height: 270,
              decoration: BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    darkMode
                        ? ColorsApp.background900
                        : ColorsApp.background500,
                    darkMode
                        ? ColorsApp.background900
                        : ColorsApp.background500,
                    darkMode ? ColorsApp.background500 : ColorsApp.background900,
                    darkMode ? ColorsApp.background500 : ColorsApp.background900,
                  ],
                  stops: const [
                    0.0,
                    0.5,
                    0.5,
                    0.0,
                  ],
               ),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  PinnedJobCardWidget(
                    servicephoto: "assets/images/2.jpg",
                    serDetails: "User interface design using Java",
                    salaryRange: "\$50-100",
                    evaluation: "9/10",
                    marked: false,
                  ),
                  SizedBox(width: 10),
                  PinnedJobCardWidget(
                    servicephoto: "assets/images/1.jpg",
                    serDetails: "Align Layouts with bootstrap ",
                    salaryRange: "\$50-100",
                    evaluation: "6/10",
                    marked: false,
                  ),
                  SizedBox(width: 10),
                  PinnedJobCardWidget(
                    servicephoto: "assets/images/google_logo.jpg",
                    serDetails: "E-commerce website",
                    salaryRange: "\$50-100",
                    evaluation: "1/10",
                    marked: false,
                  ),
                ],
              ),
            ),
          ),

          // categories section

          // recents job section
          SliverToBoxAdapter(

            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  GestureDetector(
                       child: const Text(
                   "Advertising posts",
                   style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.primary700,
                ),
              ),
            ),
                 GestureDetector(
                  onTap: () {
                   Navigator.push(
                   context,
                   MaterialPageRoute(
                    builder: (context) => advertisment(), // Replace with your desired page
                  ),
                );
              },
                   child: const Text(
                  "Show all",
                   style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.gray500,
                ),
              ),
            ),]
          ),
    ),

          ),

          SliverList(
            delegate: SliverChildListDelegate(
              const [
                RecentJobCardWidget(
                  clientphoto: "assets/images/profile1.png",
                  serDetails: "Logo Card desing",
                  clientName: "Ahmed Saleh",
                  postDate: "5 minutes ago",
                ),
                RecentJobCardWidget(
                  clientphoto: "assets/images/profile1.png",
                  serDetails: "Logo Card desing",
                  clientName: "Ahmed Saleh",
                  postDate: "5 minutes ago",
                ),
                RecentJobCardWidget(
                  clientphoto: "assets/images/profile1.png",
                  serDetails: "Logo Card desing",
                  clientName: "Ahmed Saleh",
                  postDate: "5 minutes ago",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

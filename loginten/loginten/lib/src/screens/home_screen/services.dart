import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:loginten/src/screens/home_screen/widgets/bottom_navigation_item_widget.dart';
import 'package:loginten/src/screens/home_screen/widgets/category_button_widget.dart';
import 'package:loginten/src/screens/home_screen/widgets/services_card_widget.dart';
import 'package:loginten/src/styles/colors_app.dart';

class services extends StatelessWidget {
  const services({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // app bar section
          SliverAppBar(
            toolbarHeight: 64,
            backgroundColor: ColorsApp.background900,
            pinned: true,
            title: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  Text("Applied Services",   style: TextStyle(
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

          // categories section
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 31,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryButtonWidget(
                        category: "design",
                        active: true,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 15),
                      CategoryButtonWidget(
                        category: " mobileApps ",
                        onPressed: () {},
                      ),
                      const SizedBox(width: 15),
                      CategoryButtonWidget(
                        category: "  programing ",
                        onPressed: () {},
                      ),
                      const SizedBox(width: 15),
                      CategoryButtonWidget(
                        category: "  website ",
                        onPressed: () {},
                      ),
                      const SizedBox(width: 15),
                      CategoryButtonWidget(
                        category: "  website ",
                        onPressed: () {},
                      ),
                      const SizedBox(width: 15),
                      CategoryButtonWidget(
                        category: "  website ",
                        onPressed: () {},
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              const [
                serviceCardWidget(
                  servicephoto: "assets/images/2.jpg",
                  serDetails: "UIUX mobile design using Figma & XD to create",
                  salaryRange: "\$100-200",
                  evaluation: "10/10",
                ),
                serviceCardWidget(
                  servicephoto: "assets/images/3.jpg",
                  serDetails: "Web Development from a fullstack Engineer",
                  salaryRange: "\$20",
                  evaluation: "5/10",
                ),
                serviceCardWidget(
                  servicephoto: "assets/images/1.jpg",
                  serDetails: "JavaScript Alignement",
                  salaryRange: "\$50",
                  evaluation: "7/10",
                ),
                serviceCardWidget(
                  servicephoto: "assets/images/2.jpg",
                  serDetails: "UIUX mobile design using Figma & XD to create",
                  salaryRange: "\$100-200",
                  evaluation: "10/10",
                ),
                serviceCardWidget(
                  servicephoto: "assets/images/3.jpg",
                  serDetails: "Web Development from a fullstack Engineer",
                  salaryRange: "\$20",
                  evaluation: "5/10",
                ),
                serviceCardWidget(
                  servicephoto: "assets/images/1.jpg",
                  serDetails: "JavaScript Alignement",
                  salaryRange: "\$50",
                  evaluation: "7/10",
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

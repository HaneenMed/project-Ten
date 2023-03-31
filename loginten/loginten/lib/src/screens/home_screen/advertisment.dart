import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:loginten/src/screens/home_screen/widgets/bottom_navigation_item_widget.dart';
import 'package:loginten/src/screens/home_screen/widgets/category_button_widget.dart';
import 'package:loginten/src/screens/home_screen/widgets/pinned_job_card_widget.dart';
import 'package:loginten/src/screens/home_screen/widgets/recent_job_card_widget.dart';
import 'package:loginten/src/styles/colors_app.dart';

class advertisment extends StatelessWidget {
  const advertisment({super.key});

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
                  Text("Ask for Services",   style: TextStyle(
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
                    "Sort By",
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
                        category: "Recently Add",
                        active: true,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 35),
                      CategoryButtonWidget(
                        category: "    Price   ",
                        onPressed: () {},
                      ),
                      const SizedBox(width: 35),
                      CategoryButtonWidget(
                        category: "  Evaluation  ",
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

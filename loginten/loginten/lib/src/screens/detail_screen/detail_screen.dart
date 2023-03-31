import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:heroicons/heroicons.dart';
import 'package:loginten/src/styles/colors_app.dart';
import 'package:loginten/src/screens/home_screen/widgets/profileCard.dart';

import '../home_screen/widgets/evaluationCardWidget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;


    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
          // company logo section
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 200,
              // padding: const EdgeInsets.only(top: 0),
              color:
                  darkMode ? ColorsApp.background900 : ColorsApp.background500,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: (132 - 32) / 2,
                      decoration: BoxDecoration(
                        color: darkMode
                            ? ColorsApp.background500
                            : ColorsApp.background500,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: ColorsApp.gray100,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        "assets/images/2.jpg",
                        height: 300,
                        width: 350,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 2)),

          // job & company info section
          const SliverToBoxAdapter(
            child: Padding(padding: const EdgeInsets.only(left: 25,top: 20),
            child: Text(
              "User interface design",
              //textDirection: TextDirection.rtl,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsApp.primary700,
              ),
            ),
          ),),
          //const SliverToBoxAdapter(child: SizedBox(height: 8)),
          const SliverToBoxAdapter(
            child: Padding(padding: const EdgeInsets.only(right: 35),
            child: Text(
              "\$300",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsApp.headlines,
              ),
            ),
          ),),

          SliverToBoxAdapter(
            child: Markdown(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
              data: '''
Working closely with product managers to understand user stories and feature requirements, thereby providing UI designs and UX prescriptions that address the user goals and pain points the product team is seeking to Minimum 3 years of experience in Product Design capacity
 Ability to work with and contribute to our Design System in Figma  closely with product managers to understand user stories and feature requirements, thereby providing UI designs and UX prescriptions that address the user goals and pain points the product team is seeking to Minimum 3 years of experience in Product Design capacity
 Ability to work with and contribute 
''',
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverList(
            delegate: SliverChildListDelegate(
              const [
                profileCardWidget(
                  providerphoto: "assets/images/pro.png",
                  providerName: "Ahmed Saleh",
                  workTime:"Work take                3-5 days",
                  replyAverage:"Reply Average          1 hour",
                ),
                evaluationCardWidget(
                 title: "Evaluation",
                  quality: "quality                                                          9/10",
                  communicate: "communicate                                               8/10",
                    onTime:"Deliever on time                                          10/10",
                    workAgain:"Work with again                                          10/10",
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],


      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: darkMode ? ColorsApp.background500 : ColorsApp.white,
          border: Border(
            top: BorderSide(
              color: darkMode ? ColorsApp.gray800 : ColorsApp.gray100,
            ),
          ),
        ),
        child: SafeArea(
          child: IntrinsicHeight(
            child: Row(
              children: [

                const SizedBox(width: 5),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.headlines,
                      foregroundColor: ColorsApp.gray100,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      elevation: 0,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: const Size.fromHeight(48),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("Buy Now"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

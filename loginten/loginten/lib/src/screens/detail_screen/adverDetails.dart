import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:heroicons/heroicons.dart';
import 'package:loginten/src/styles/colors_app.dart';
import 'package:loginten/src/screens/home_screen/widgets/profileCard.dart';
import 'package:loginten/src/screens/home_screen/widgets/statusCard.dart';
import '../home_screen/widgets/clientCard.dart';
import '../home_screen/widgets/evaluationCardWidget.dart';
import '../home_screen/widgets/proposal.dart';

class adverDetails extends StatelessWidget {
  const adverDetails({super.key});

  @override
  Widget build(BuildContext context) {
   // final bool darkMode = Theme.of(context).brightness == Brightness.dark;


    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
          // job & company info section
          const SliverToBoxAdapter(
            child: Padding(padding: const EdgeInsets.only(left: 25,top: 20),
              child: Text(
                "Logo design",
                //textDirection: TextDirection.rtl,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.primary700,
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
 Ability to work with and contribute to our Design System in Figma  closely with product managers
 \nRequirement Skills :
 - feature requirements
 - Thereby providing UI designs and UX prescriptions that
''',
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverList(
            delegate: SliverChildListDelegate(
              const [
                evaluationCardWidget(
                  title: "Project Info ",
                  quality: "Publish-Time                                 2 hours ago",
                  communicate: "Working-Time                                     5 days",
                  onTime:"Budget                                                \$100-200",
                  workAgain:"Offers                                                     11",
                ),
                statusCardWidget(
                  title: "Project Status ",
                 recieve : "Receive offers",
                  execute: "Execute",
                  deliver:"Delivery",
                ),
                clientCardWidget(
                  clientphoto: "assets/images/pro.png",
                  clientName: "Ahmed Saleh",
                  active: "Active 3 minutes ago",

                ),
                Spacer(),
                ProposalFormWidget(
                  title: "Make Offer",
                  budget: "Budget",
                  time: "Deliver Time",

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

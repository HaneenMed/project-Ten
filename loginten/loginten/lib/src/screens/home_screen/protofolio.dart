import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loginten/src/screens/home_screen/widgets/services_card_widget.dart';
import '../../styles/colors_app.dart';

class protofolio extends StatefulWidget {
  const protofolio({super.key});

  @override
  State<protofolio> createState() => _protofolioState();
}

class _protofolioState extends State<protofolio> {
  final double _outerPadding = 16;
  final double _largePadding = 40;
  final double _smallPadding = 16;
  final double _smallerPadding = 8;

  final Color _mainPurple = Colors.deepPurpleAccent.shade100;
  final int _whiteAlpha = 90;
  final int _blackAlpha = 90;

  final TextStyle _heading1 = const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700);
  final TextStyle _heading2 = const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _buttonText = const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold);
  final TextStyle _subtitle1 = const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

  // final List<Map<String, dynamic>> _places = [
  //   {
  //     'title': 'About me',
  //     'date': 'Web developer , UIUX designer \nGraduate from IT',
  //   },
  //   {
  //     'title': 'Statistics',
  //     'date': 'evaluation                         9/10\nPublished Services             3\nClients                                    1\nReply-Average                   null\n                ',
  //   },
  //   {
  //     'title': 'Last Seen',
  //     'date': '10:00 - 18 March 2023',
  //   },
  //   {
  //     'title': 'Authentications',
  //     'date': 'Identity     \nE-mail     ',
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background900,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // image: DecorationImage(image: AssetImage('assets/background.jpeg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(_outerPadding),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Your profile', style:TextStyle(color: ColorsApp.headlines , fontSize: 22),),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(color:ColorsApp.background900, borderRadius: const BorderRadius.all(Radius.circular(100))),
                        child: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_sharp)),
                      ),
                    ],
                  ),
                  SizedBox(height: _largePadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(_whiteAlpha),
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withAlpha(_whiteAlpha),
                            child: ClipOval(
                              child: Image.asset("assets/images/profile1.png"),
                            ),
                          ),
                        ),
                        SizedBox(height: _smallPadding),
                        Text('User Name', style:TextStyle(color: ColorsApp.primary700 , fontSize: 20 )),
                        SizedBox(height: _smallPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // children: [
                          //   const Icon(Icons.location_on_outlined, color: Colors.white),
                          //   Text("South Africa, Gauteng, Pretoria", style: _subtitle1),
                          // ],
                        ),
                        SizedBox(height: _smallPadding),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:ColorsApp.headlines ,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                          ),
                          child: Text('My Profile', style: _buttonText),
                        ),
                      ],
                    ),
                  ),

              // slivers: [
              //     SliverList(
              //       delegate: SliverChildListDelegate(
              //         const [
              //           serviceCardWidget(
              //             servicephoto: "assets/images/2.jpg",
              //             serDetails: "UIUX mobile design using Figma & XD to create",
              //             salaryRange: "\$100-200",
              //             evaluation: "10/10",
              //           ),
              //           serviceCardWidget(
              //             servicephoto: "assets/images/3.jpg",
              //             serDetails: "Web Development from a fullstack Engineer",
              //             salaryRange: "\$20",
              //             evaluation: "5/10",
              //           ),
              //           serviceCardWidget(
              //             servicephoto: "assets/images/1.jpg",
              //             serDetails: "JavaScript Alignement",
              //             salaryRange: "\$50",
              //             evaluation: "7/10",
              //           ),
              //           serviceCardWidget(
              //             servicephoto: "assets/images/2.jpg",
              //             serDetails: "UIUX mobile design using Figma & XD to create",
              //             salaryRange: "\$100-200",
              //             evaluation: "10/10",
              //           ),
              //           serviceCardWidget(
              //             servicephoto: "assets/images/3.jpg",
              //             serDetails: "Web Development from a fullstack Engineer",
              //             salaryRange: "\$20",
              //             evaluation: "5/10",
              //           ),
              //           serviceCardWidget(
              //             servicephoto: "assets/images/1.jpg",
              //             serDetails: "JavaScript Alignement",
              //             salaryRange: "\$50",
              //             evaluation: "7/10",
              //           ),
              //         ],
              //       ),
              //     ),]
                  // SizedBox(height: _largePadding),
                  //
                  // SizedBox(height: _smallPadding),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: _places.length,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     Map<String, dynamic> place = _places[index];
                  //     return Padding(
                  //       padding: const EdgeInsets.only(bottom: 16),
                  //       child: ClipRRect(
                  //         borderRadius: const BorderRadius.all(Radius.circular(5)),
                  //         child: BackdropFilter(
                  //           filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               color: ColorsApp.gray200,
                  //               borderRadius: const BorderRadius.all(Radius.circular(5)),
                  //             ),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //                 SizedBox(width: _smallerPadding,height: 80,),
                  //                 Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //                   children: [
                  //                     Text(place['title'], style:TextStyle(color: ColorsApp.primary700)),
                  //                     const SizedBox(height: 10),
                  //                     Row(
                  //                       children: [
                  //                         //  const Icon(Icons.calendar_today_outlined, color: Colors.white),
                  //                         SizedBox(width: _smallerPadding),
                  //                         Text(place['date'],style:TextStyle(color: ColorsApp.gray500)),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 const Spacer(),
                  //                 IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: Colors.white)),
                  //                 SizedBox(width: _smallerPadding),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loginten/src/screens/detail_screen/detail_screen.dart';
import 'package:loginten/src/styles/colors_app.dart';

class statisticCardWidget extends StatelessWidget {
  const statisticCardWidget({
    super.key,
    required this.title,
    required this.quality,
    required this.communicate,
    required this.onTime,
    required this.workAgain,
  });

  final String title;
  final String quality;
  final String communicate;
  final String onTime;
  final String workAgain;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //     const DetailScreen(),
      //   ),
      // ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkMode ? ColorsApp.background500 : ColorsApp.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: darkMode
                  ? ColorsApp.white.withOpacity(0.05)
                  : ColorsApp.gray500.withOpacity(0.05),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: darkMode ? ColorsApp.white : ColorsApp.gray500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    quality,
                    style: const TextStyle(
                      fontSize: 12,
                      //fontWeight: FontWeight.bold,
                      color: ColorsApp.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    communicate,
                    style: const TextStyle(
                      fontSize: 12,
                      //fontWeight: FontWeight.bold,
                      color: ColorsApp.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onTime,
                    style: const TextStyle(
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                      color: ColorsApp.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        workAgain,
                        style: const TextStyle(
                          fontSize: 12,
                          //fontWeight: FontWeight.bold,
                          color: ColorsApp.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),

                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}

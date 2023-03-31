import 'package:flutter/material.dart';
import 'package:loginten/src/screens/detail_screen/detail_screen.dart';
import 'package:loginten/src/styles/colors_app.dart';

class profileCardWidget extends StatelessWidget {
  const profileCardWidget({
    super.key,
    required this.providerphoto,
    required this.providerName,
    required this.replyAverage,
    required this.workTime,
  });

  final String providerphoto;
  final String providerName;
  final String replyAverage;
  final String workTime;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const DetailScreen(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkMode ? ColorsApp.background500 : ColorsApp.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: darkMode
                  ? ColorsApp.primary700.withOpacity(0.05)
                  : ColorsApp.gray500.withOpacity(0.05),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // border: Border.all(
                //   color: ColorsApp.gray100,
                //   strokeAlign: BorderSide.strokeAlignOutside,
                // ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                providerphoto,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    providerName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    replyAverage,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.gray500,
                    ),
                  ),

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        workTime,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.gray500,
                        ),
                      ),

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

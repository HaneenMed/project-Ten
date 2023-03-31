import 'package:flutter/material.dart';
import 'package:loginten/src/screens/detail_screen/detail_screen.dart';
import 'package:loginten/src/styles/colors_app.dart';

class PinnedJobCardWidget extends StatelessWidget {
  const PinnedJobCardWidget({
    super.key,
    required this.servicephoto,
    required this.serDetails,
    required this.salaryRange,
    required this.evaluation,
    this.marked = false,
  });

  final String servicephoto;
  final String serDetails;
  final String salaryRange;
  final String evaluation;

  final bool? marked;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;

    Color cardColor;
    Color cardBorderColor;
    Color imageBorderColor;
    Color primaryTextColor;
    Color secondaryTextColor;
    //Color evaluationBackgroundColor;
    Color evaluationForegroundColor;

    if (marked == true) {
      cardColor = ColorsApp.primary700;
      cardBorderColor = ColorsApp.primary700;
      imageBorderColor = ColorsApp.primary700;
      primaryTextColor = ColorsApp.white;
      secondaryTextColor = ColorsApp.gray300;
      //evaluationBackgroundColor = ColorsApp.primary600;
      evaluationForegroundColor = ColorsApp.white;
    } else {
      cardColor = darkMode ? ColorsApp.background500 : ColorsApp.white;
      imageBorderColor = ColorsApp.gray100;
      cardBorderColor = darkMode ? ColorsApp.gray200 : ColorsApp.gray100;
      primaryTextColor = darkMode ? ColorsApp.white : ColorsApp.black;
      secondaryTextColor = ColorsApp.gray500;
      // evaluationBackgroundColor = darkMode ? ColorsApp.gray800 : ColorsApp.gray100;
      evaluationForegroundColor = ColorsApp.headlines;
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DetailScreen(),
        ),
      ),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: cardBorderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(

                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    servicephoto,
                    height: 120,
                    width: 215,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              serDetails,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryTextColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              salaryRange,
              style: TextStyle(
                fontSize: 14,
                color: secondaryTextColor,
              ),
            ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.fromLTRB(180, 0, 0, 6),
              child: Text(
                evaluation,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: evaluationForegroundColor,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

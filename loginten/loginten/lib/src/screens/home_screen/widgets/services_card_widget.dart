import 'package:flutter/material.dart';
import 'package:loginten/src/screens/detail_screen/adverDetails.dart';
import 'package:loginten/src/screens/detail_screen/detail_screen.dart';
import 'package:loginten/src/styles/colors_app.dart';

class serviceCardWidget extends StatelessWidget {
  const serviceCardWidget({
    super.key,
    required this.servicephoto,
    required this.serDetails,
    required this.salaryRange,
    required this.evaluation,
  });

  final String servicephoto;
  final String serDetails;
  final String salaryRange;
  final String evaluation;

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
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: darkMode ? ColorsApp.background500 : ColorsApp.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: darkMode
                  ? ColorsApp.white.withOpacity(0.05)
                  : ColorsApp.gray500.withOpacity(0.05),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                  color: ColorsApp.gray100,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                servicephoto,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serDetails,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: darkMode ? ColorsApp.white : ColorsApp.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    salaryRange,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.gray500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(180, 0, 0, 6),
                    child: Text(
                      evaluation,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.headlines,

                      ),
                    ),
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

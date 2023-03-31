import 'package:flutter/material.dart';
import 'package:loginten/src/screens/detail_screen/adverDetails.dart';
import 'package:loginten/src/screens/detail_screen/detail_screen.dart';
import 'package:loginten/src/styles/colors_app.dart';

class RecentJobCardWidget extends StatelessWidget {
  const RecentJobCardWidget({
    super.key,
    required this.clientphoto,
    required this.serDetails,
    required this.clientName,
    required this.postDate,
  });

  final String clientphoto;
  final String serDetails;
  final String clientName;
  final String postDate;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const adverDetails(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
        padding: const EdgeInsets.all(16),
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
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: ColorsApp.gray100,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                clientphoto,
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
                  Text(
                    serDetails,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: darkMode ? ColorsApp.white : ColorsApp.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    clientName,
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
                        postDate,
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

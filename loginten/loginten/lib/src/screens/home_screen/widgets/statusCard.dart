import 'package:flutter/material.dart';
import 'package:loginten/src/screens/detail_screen/detail_screen.dart';
import 'package:loginten/src/styles/colors_app.dart';

class statusCardWidget extends StatelessWidget {
  const statusCardWidget({
    super.key,
    required this.title,
    required this.recieve,
    required this.execute,
    required this.deliver,

  });

  final String title;
  final String recieve;
  final String execute;
  final String deliver;

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
                      color: darkMode ? ColorsApp.white : ColorsApp.primary700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    recieve,
                    style: const TextStyle(
                      fontSize: 12,
                      //fontWeight: FontWeight.bold,
                      color: ColorsApp.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                   execute,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.marked,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    deliver,
                    style: const TextStyle(
                      fontSize: 12,
                     // fontWeight: FontWeight.bold,
                      color: ColorsApp.black,
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

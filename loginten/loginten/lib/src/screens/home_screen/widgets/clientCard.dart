import 'package:flutter/material.dart';
import 'package:loginten/src/screens/detail_screen/detail_screen.dart';
import 'package:loginten/src/styles/colors_app.dart';

class clientCardWidget extends StatelessWidget {
  const clientCardWidget({
    super.key,
    required this.clientphoto,
    required this.clientName,
    required this.active,

  });

  final String clientphoto;
  final String clientName;
  final String active;


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
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
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
                border: Border.all(
                  color: ColorsApp.gray100,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                clientphoto,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    clientName,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColorsApp.black,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    active,
                    style: const TextStyle(
                      fontSize: 12,
                      color: ColorsApp.gray500,
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

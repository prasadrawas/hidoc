import 'package:flutter/material.dart';
import 'package:hidoc/res/app_text_styles.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final Color color;
  final Color background;
  final IconData icon;
  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: background,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: AppTextStyles.smallLightText(color: color),
            ),
          ],
        ),
      ),
    ));
  }
}

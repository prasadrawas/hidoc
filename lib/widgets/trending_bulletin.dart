import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_text_styles.dart';

import 'bulletin.dart';

class TrendingBulletin extends StatelessWidget {
  const TrendingBulletin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Treding Hidoc Bulletin',
            style: AppTextStyles.xxLargeBoldText().copyWith(fontSize: 25),
          ),
          const Bulletin(),
          const Bulletin(),
          const Bulletin(),
          const Bulletin(),
        ],
      ),
    );
  }
}

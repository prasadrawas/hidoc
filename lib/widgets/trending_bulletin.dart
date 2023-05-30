import 'package:flutter/material.dart';
import 'package:hidoc/model/article/article.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_text_styles.dart';

import 'bulletin.dart';

class TrendingBulletin extends StatelessWidget {
  final List<ArticleClass> trendingBulletins;
  const TrendingBulletin({
    super.key,
    required this.trendingBulletins,
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
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trendingBulletins.length,
              itemBuilder: (_, i) {
                final bulletin = trendingBulletins[i];
                return Bulletin(bulletin: bulletin);
              })
        ],
      ),
    );
  }
}

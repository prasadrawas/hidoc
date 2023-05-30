import 'package:flutter/material.dart';
import 'package:hidoc/model/article/article.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/widgets/bulletin.dart';

class BulletinWidget extends StatelessWidget {
  final List<ArticleClass> bulletins;
  final BoxConstraints constraints;
  const BulletinWidget(
    this.constraints, {
    super.key,
    required this.bulletins,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hidocButtin,
          style: AppTextStyles.largeBoldText(),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bulletins.length,
          itemBuilder: (_, i) {
            final bulletin = bulletins[i];
            return Bulletin(bulletin: bulletin);
          },
        )
      ],
    );
  }
}

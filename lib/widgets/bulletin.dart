import 'package:flutter/material.dart';
import 'package:hidoc/model/article/article.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/widgets/app_text_button.dart';

import '../res/app_strings.dart';

class Bulletin extends StatelessWidget {
  final ArticleClass? bulletin;
  const Bulletin({
    super.key,
    required this.bulletin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width * 0.20,
          height: 6,
          decoration: BoxDecoration(
            color: buttonBlueColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
        ),
        Text(
          bulletin?.articleTitle ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.mediumBoldText(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            bulletin?.articleDescription ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.smallLightText(),
          ),
        ),
        AppTextButton(onPressed: () {}, text: readMore),
      ],
    );
  }
}

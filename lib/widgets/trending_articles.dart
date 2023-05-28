import 'package:flutter/material.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/url_constants.dart';

class TrendingArticles extends StatelessWidget {
  const TrendingArticles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              latestArticles,
              style: AppTextStyles.largeBoldText(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.network(
              noImageFound,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Text(
              lorem,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.smallLightText(),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (_, i) {
              return ListTile(
                leading: Image.network(
                  noImageFound,
                  height: 80,
                ),
                title: Text(
                  lorem,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLightText(),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Divider(),
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

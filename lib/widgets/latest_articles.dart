import 'package:flutter/material.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';

class LatestArticles extends StatelessWidget {
  final String heading;
  const LatestArticles({
    super.key,
    required this.heading,
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
          const SizedBox(height: 15),
          Text(
            heading,
            style: AppTextStyles.largeBoldText(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Divider(),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
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

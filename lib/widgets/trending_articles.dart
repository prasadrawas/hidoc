import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/model/article/article.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/url_constants.dart';

import '../res/app_colors.dart';

class TrendingArticles extends StatelessWidget {
  final List<ArticleClass> articles;
  const TrendingArticles({
    super.key,
    required this.articles,
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
          /* Padding(
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
          ),*/
          const Divider(),
          articles.isEmpty
              ? const Center(
                  child: Text('No data found'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (_, i) {
                    return ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: articles[i].articleImg ?? '',
                        width: 80,
                        placeholder: (context, url) => SizedBox(
                          height: 1,
                          child: LinearProgressIndicator(
                            color: buttonBlueColor,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            CachedNetworkImage(
                          imageUrl: noImageFound,
                          width: 80,
                        ),
                      ),
                      title: Text(
                        articles[i].articleDescription ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.smallLightText(),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/model/article/article.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/url_constants.dart';

import '../res/dimens.dart';

class NewsWidget extends StatelessWidget {
  final List<News> newsList;
  const NewsWidget(
    this.constraints, {
    super.key,
    required this.newsList,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondary.withOpacity(0.7),
      ),
      child: constraints.maxWidth <= mobileWidth
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    news,
                    style: AppTextStyles.largeBoldText(),
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsList.length,
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            newsList[i].description ?? '',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.smallLightText(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CachedNetworkImage(
                          imageUrl: newsList[i].urlToImage ?? '',
                          width: double.infinity,
                          placeholder: (context, url) =>
                              const LinearProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              CachedNetworkImage(
                            imageUrl: noImageFound,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Divider(),
                    );
                  },
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, bottom: 25),
                  child: Text(
                    news,
                    style: AppTextStyles.largeBoldText(),
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsList.length,
                  itemBuilder: (_, i) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: newsList[i].urlToImage ?? '',
                          width: 200,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              CachedNetworkImage(
                            imageUrl: noImageFound,
                            width: 200,
                          ),
                        ),
                        const SizedBox(width: 25),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  newsList[i].title ?? '',
                                  style: AppTextStyles.largeBoldText(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  newsList[i].description ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.smallLightText(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ],
            ),
    );
  }
}

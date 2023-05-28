import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/dimens.dart';
import 'package:hidoc/res/url_constants.dart';

class ImageCard extends StatelessWidget {
  final BoxConstraints constraints;
  const ImageCard(
    this.constraints, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: constraints.maxWidth <= mobileWidth
          ? Column(
              children: [_buildImage(), _buildBody()],
            )
          : Row(
              children: [_buildImage(), Flexible(child: _buildBody())],
            ),
    );
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: constraints.maxWidth <= mobileWidth ? 15 : 40),
          child: Text(
            lorem,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regularSemiBoldText(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            lorem,
            style: AppTextStyles.smallLightText()
                .copyWith(height: 1.7, fontStyle: FontStyle.italic),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                readFullArticle,
                style: AppTextStyles.smallLightText(color: buttonBlueColor)
                    .copyWith(
                  height: 1.7,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: buttonBlueColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    points,
                    style: AppTextStyles.smallLightText(color: Colors.white),
                  ),
                  Text(
                    '2',
                    style: AppTextStyles.xxLargeBoldText(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: CachedNetworkImage(
        imageUrl: noImageFound,
        width: constraints.maxWidth <= mobileWidth ? double.infinity : 350,
        placeholder: (context, url) => SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              color: buttonBlueColor,
            )),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

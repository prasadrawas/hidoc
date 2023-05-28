import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/dimens.dart';
import 'package:hidoc/widgets/feature_card.dart';

// ignore: camel_case_types
class bottomBar extends StatelessWidget {
  final BoxConstraints constraints;
  const bottomBar(
    this.constraints, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          width: MediaQuery.of(context).size.width,
          color: purpleColor,
          child: constraints.maxWidth <= 500
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildColOne(),
                    const SizedBox(
                      width: 15,
                      height: 20,
                    ),
                    buildColTwo(),
                    const SizedBox(width: 15, height: 20),
                    buildColThree(),
                  ],
                )
              : constraints.maxWidth <= mobileWidth
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(child: buildColOne()),
                            const SizedBox(
                              width: 15,
                              height: 20,
                            ),
                            Flexible(child: buildColTwo()),
                            const SizedBox(height: 20),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildColThree(),
                          ],
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: buildColOne(),
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          flex: 2,
                          child: buildColTwo(),
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          flex: 4,
                          child: buildColThree(),
                        ),
                      ],
                    ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Copyright 2022 ',
                    style: AppTextStyles.smallLightText(),
                  ),
                  Text(
                    'Infdis Infotech LLP',
                    style: AppTextStyles.smallBoldText(),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms & Conditions | Privacy Policy',
                    style: AppTextStyles.smallLightText(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildColThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hidoc Dr. Features',
          style: AppTextStyles.largeBoldText(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            FeatureCard(
              icon: Icons.nature_people_outlined,
              title: 'Social Network',
              color: Colors.red,
              background: Colors.red.shade100,
            ),
            FeatureCard(
              icon: Icons.cases_outlined,
              title: 'Case Presentation',
              color: Colors.yellow,
              background: Colors.yellow.shade100,
            ),
            FeatureCard(
              icon: Icons.panorama_horizontal_select,
              title: 'Quizzes',
              color: Colors.blueAccent,
              background: Colors.blueAccent.shade100,
            ),
            FeatureCard(
              icon: Icons.article_outlined,
              title: 'Articles',
              color: Colors.green,
              background: Colors.green.shade100,
            ),
          ],
        ),
        Row(
          children: [
            FeatureCard(
              icon: Icons.panorama_horizontal_select,
              title: 'Quizzes',
              color: Colors.blueAccent,
              background: Colors.blueAccent.shade100,
            ),
            FeatureCard(
              icon: Icons.article_outlined,
              title: 'Articles',
              color: Colors.green,
              background: Colors.green.shade100,
            ),
            FeatureCard(
              icon: Icons.nature_people_outlined,
              title: 'Social Network',
              color: Colors.red,
              background: Colors.red.shade100,
            ),
            FeatureCard(
              icon: Icons.cases_outlined,
              title: 'Case Presentation',
              color: Colors.yellow,
              background: Colors.yellow.shade100,
            ),
          ],
        ),
      ],
    );
  }

  Column buildColTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          reachUs,
          style: AppTextStyles.largeBoldText(color: Colors.white),
        ),
        Text(
          lorem,
          maxLines: 2,
          style: AppTextStyles.smallLightText(color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          email,
          style: AppTextStyles.smallLightText(color: buttonBlueColor),
        ),
        Text(
          'dr@hodic.com',
          style: AppTextStyles.smallLightText(color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          address,
          style: AppTextStyles.smallLightText(color: buttonBlueColor),
        ),
        Text(
          lorem,
          maxLines: 2,
          style: AppTextStyles.smallLightText(color: Colors.white),
        ),
      ],
    );
  }

  Column buildColOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        Text(
          lorem,
          maxLines: 2,
          style: AppTextStyles.smallLightText(color: Colors.white),
        )
      ],
    );
  }
}

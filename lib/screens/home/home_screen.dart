import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/dimens.dart';
import 'package:hidoc/screens/home/viewmodel/home_screen_view_model.dart';
import 'package:hidoc/utils/base/base_view_model.dart';
import 'package:hidoc/utils/helper.dart';
import 'package:hidoc/widgets/bottom.dart';
import 'package:hidoc/widgets/bottom_bar.dart';
import 'package:hidoc/widgets/bulletin_widget.dart';
import 'package:hidoc/widgets/custom_app_bar.dart';
import 'package:hidoc/widgets/custom_text_field.dart';
import 'package:hidoc/widgets/feature.dart';
import 'package:hidoc/widgets/image_card.dart';
import 'package:hidoc/widgets/latest_articles.dart';
import 'package:hidoc/widgets/news.dart';
import 'package:hidoc/widgets/primary_button.dart';
import 'package:hidoc/widgets/trending_articles.dart';
import 'package:hidoc/widgets/trending_bulletin.dart';

import '../../widgets/custom_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categoryController.text = 'Critical Care';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<HomeScreenViewModel>(
          onModelReady: (model) => model.getArticles(context),
          builder: (_, model, __) {
            if (model.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (model.article != null) {
                return LayoutBuilder(builder: (context, constraints) {
                  return CustomPaint(
                    painter: CustomShapePainter(),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: SafeArea(
                        child: Column(
                          children: [
                            if (!kIsWeb)
                              const Expanded(
                                flex: 1,
                                child: CustomAppBar(),
                              ),
                            Expanded(
                              flex: 4,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: !kIsWeb
                                            ? 15
                                            : constraints.maxWidth <=
                                                    mobileWidth
                                                ? 15
                                                : 150,
                                        right: !kIsWeb
                                            ? 15
                                            : constraints.maxWidth <=
                                                    mobileWidth
                                                ? 15
                                                : 150,
                                        top: !kIsWeb ? 0 : 60,
                                      ),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: AppTextField(
                                              controller: _categoryController,
                                              width: !kIsWeb
                                                  ? double.infinity
                                                  : 450,
                                              enabled: false,
                                              textAlign: TextAlign.center,
                                              enableShadow: true,
                                              marginBottom: 20,
                                              suffixIcon: const Icon(
                                                  Icons.arrow_drop_down),
                                              onPressed: () {
                                                openCategoryListDialog(context,
                                                    (s) {
                                                  _categoryController.text = s;
                                                });
                                              },
                                            ),
                                          ),
                                          ImageCard(constraints,
                                              article:
                                                  model.article?.data?.article),
                                          const SizedBox(height: 20),
                                          !kIsWeb ||
                                                  constraints.maxWidth <=
                                                      mobileWidth
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    BulletinWidget(constraints,
                                                        bulletins: model
                                                                .article
                                                                ?.data
                                                                ?.bulletin ??
                                                            []),
                                                    const SizedBox(height: 25),
                                                    TrendingBulletin(
                                                        trendingBulletins: model
                                                                .article
                                                                ?.data
                                                                ?.trandingBulletin ??
                                                            []),
                                                  ],
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                        child: BulletinWidget(
                                                            constraints,
                                                            bulletins: model
                                                                    .article
                                                                    ?.data
                                                                    ?.bulletin ??
                                                                [])),
                                                    Flexible(
                                                      child: TrendingBulletin(
                                                          trendingBulletins: model
                                                                  .article
                                                                  ?.data
                                                                  ?.trandingBulletin ??
                                                              []),
                                                    ),
                                                  ],
                                                ),
                                          Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 25),
                                              child: PrimaryButton(
                                                width: !kIsWeb ? 250 : 400,
                                                label: readMoreBulletins,
                                                background: !kIsWeb
                                                    ? null
                                                    : buttonBlueColor,
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                          !kIsWeb ||
                                                  constraints.maxWidth <=
                                                      mobileWidth
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    LatestArticles(
                                                        heading: latestArticles,
                                                        articles: model
                                                                .article
                                                                ?.data
                                                                ?.latestArticle ??
                                                            []),
                                                    const SizedBox(height: 30),
                                                    TrendingArticles(
                                                        articles: model
                                                                .article
                                                                ?.data
                                                                ?.trandingArticle ??
                                                            []),
                                                    const SizedBox(height: 30),
                                                    LatestArticles(
                                                        heading:
                                                            exploreMoreInArticles,
                                                        articles: model
                                                                .article
                                                                ?.data
                                                                ?.exploreArticle ??
                                                            []),
                                                  ],
                                                )
                                              : Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                        child: LatestArticles(
                                                            heading:
                                                                latestArticles,
                                                            articles: model
                                                                    .article
                                                                    ?.data
                                                                    ?.latestArticle ??
                                                                [])),
                                                    const SizedBox(width: 15),
                                                    Flexible(
                                                        child: TrendingArticles(
                                                            articles: model
                                                                    .article
                                                                    ?.data
                                                                    ?.trandingArticle ??
                                                                [])),
                                                    const SizedBox(width: 15),
                                                    Flexible(
                                                        child: Column(
                                                      children: [
                                                        LatestArticles(
                                                            heading:
                                                                exploreMoreInArticles,
                                                            articles: model
                                                                    .article
                                                                    ?.data
                                                                    ?.exploreArticle ??
                                                                []),
                                                        Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        15),
                                                            child:
                                                                PrimaryButton(
                                                              width: constraints
                                                                          .maxWidth <=
                                                                      mobileWidth
                                                                  ? 250
                                                                  : 400,
                                                              label:
                                                                  exploreHidocDr,
                                                              background: constraints
                                                                          .maxWidth <=
                                                                      mobileWidth
                                                                  ? null
                                                                  : buttonBlueColor,
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                  ],
                                                ),
                                          if (!kIsWeb)
                                            const SizedBox(height: 30),
                                          if (!kIsWeb)
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                child: PrimaryButton(
                                                  label: exploreHidocDr,
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          const SizedBox(height: 20),
                                          !kIsWeb ||
                                                  constraints.maxWidth <=
                                                      mobileWidth
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    NewsWidget(constraints,
                                                        newsList: model.article
                                                                ?.data?.news ??
                                                            []),
                                                    const SizedBox(height: 20),
                                                    const Features(),
                                                    const SizedBox(height: 20),
                                                  ],
                                                )
                                              : Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                        flex: 2,
                                                        child: NewsWidget(
                                                            constraints,
                                                            newsList: model
                                                                    .article
                                                                    ?.data
                                                                    ?.news ??
                                                                [])),
                                                    const SizedBox(width: 20),
                                                    const Flexible(
                                                        flex: 1,
                                                        child: Features()),
                                                  ],
                                                ),
                                          const SizedBox(height: 30),
                                          Bottom(constraints),
                                          const SizedBox(height: 30),
                                        ],
                                      ),
                                    ),
                                    if (kIsWeb) bottomBar(constraints),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              } else {
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: AppTextStyles.smallLightText(),
                  ),
                );
              }
            }
          }),
    );
  }
}

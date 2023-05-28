import 'package:flutter/material.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/widgets/bulletin.dart';

class BulletinWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const BulletinWidget(
    this.constraints, {
    super.key,
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
        const Bulletin(),
        const Bulletin(),
        const Bulletin(),
        const Bulletin()
      ],
    );
  }
}

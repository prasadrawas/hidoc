import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/dimens.dart';
import 'package:hidoc/widgets/primary_button.dart';

class Bottom extends StatelessWidget {
  final BoxConstraints constraints;
  const Bottom(
    this.constraints, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: constraints.maxWidth <= mobileWidth
            ? secondary.withOpacity(0.9)
            : buttonBlueColor.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                lorem,
                maxLines: 1,
                style: AppTextStyles.regularBoldText(),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: PrimaryButton(
              label: visit,
              height: 35,
              radius: 100,
              width: 100,
              background:
                  constraints.maxWidth <= mobileWidth ? null : buttonBlueColor,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

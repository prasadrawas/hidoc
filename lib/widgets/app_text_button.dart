import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';

import '../res/app_text_styles.dart';

class AppTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const AppTextButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(50, 30),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.smallLightText(color: buttonBlueColor).copyWith(
          fontSize: 14,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';

import '../res/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final bool? disable;
  final IconData? iconName;
  final double height;
  final double width;
  final double radius;
  final Color? background;
  final Color textColor;
  final double elevation;
  final IconData? prefixIcon;
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disable,
    this.iconName,
    this.height = 45,
    this.width = 250,
    this.radius = 0,
    this.background,
    this.textColor = Colors.white,
    this.elevation = 2,
    this.prefixIcon,
  });

  @override
  Widget build(context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(elevation),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all(background ?? buttonOrangeColor),
          ),
          onPressed: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                Icon(
                  prefixIcon,
                  color: Colors.black87,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  label,
                  style: AppTextStyles.regularText(color: textColor),
                ),
              ),
            ],
          )),
    );
  }
}

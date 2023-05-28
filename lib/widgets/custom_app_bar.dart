import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 30,
            width: 100,
            margin: const EdgeInsets.only(top: 40, bottom: 20),
            decoration: BoxDecoration(
              color: buttonBlueColor.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
                child: Text(
              hidoc,
              style: AppTextStyles.regularBoldText(color: Colors.white),
            )),
          ),
        ),
        ListTile(
          leading: Container(
            width: 50,
            height: 50,
            // padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2.5, color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              'Articles',
              style: AppTextStyles.xxLargeBoldText(),
              textAlign: TextAlign.center,
            ),
          ),
          titleAlignment: ListTileTitleAlignment.center,
        ),
      ],
    );
  }
}

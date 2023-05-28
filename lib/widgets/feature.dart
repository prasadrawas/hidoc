import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';
import 'package:hidoc/res/app_strings.dart';
import 'package:hidoc/res/app_text_styles.dart';

class Features extends StatelessWidget {
  const Features({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: buttonBlueColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.panorama_horizontal_select_outlined,
                    color: buttonBlueColor,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  quizzes,
                  style: AppTextStyles.regularBoldText(),
                ),
              ),
              Flexible(
                  flex: 4,
                  child: Text(
                    lorem,
                    maxLines: 2,
                    style:
                        AppTextStyles.smallLightText().copyWith(fontSize: 10),
                  )),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: buttonBlueColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.calculate_outlined,
                    color: buttonBlueColor,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  medicalCalculator,
                  style: AppTextStyles.regularBoldText(),
                ),
              ),
              Flexible(
                flex: 4,
                child: Text(
                  lorem,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.smallLightText().copyWith(fontSize: 10),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

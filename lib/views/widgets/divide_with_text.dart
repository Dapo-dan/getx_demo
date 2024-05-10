import 'package:flutter/material.dart';
import 'package:getxdemo/shared/theme/app_colors.dart';
import 'package:getxdemo/shared/theme/text_styles.dart';

class DivideWithText extends StatelessWidget {
  final String text;
  final Color color;
  final bool drawLines;

  const DivideWithText({
    Key? key,
    required this.text,
    this.color = AppColors.white,
    this.drawLines = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (drawLines) ...[
          Expanded(
            child: Divider(color: color),
          ),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            text,
            style: TextStyles.regular.copyWith(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (drawLines) ...[
          Expanded(
            child: Divider(color: color),
          ),
        ],
      ],
    );
  }
}

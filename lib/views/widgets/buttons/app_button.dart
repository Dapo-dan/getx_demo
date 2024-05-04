import 'package:flutter/material.dart';
import 'package:getxdemo/shared/helpers/ui_helpers.dart';
import 'package:getxdemo/shared/theme/app_colors.dart';
import 'package:getxdemo/shared/theme/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    this.backgroundColor,
    this.buttonText = "button text",
    this.buttonHeight,
    this.elevation = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.buttonWidth,
    this.isLoading = false,
    this.isLightMode = false,
    this.buttonTextColor,
    super.key,
  });
  final Function() onTap;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final Color? buttonTextColor;
  final double? elevation;
  final double leftPadding;
  final double rightPadding;
  final bool isLoading;
  final bool isLightMode;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        padding: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: leftPadding,
          right: rightPadding,
        ),
        backgroundColor: backgroundColor ??
            (isLightMode ? AppColors.text : AppColors.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        fixedSize: Size(
            buttonWidth ?? screenWidth(context), buttonHeight ?? 48),
      ),
      onPressed: onTap,
      child: Visibility(
        visible: isLoading,
        replacement: Text(
          buttonText,
          style: TextStyles.medium.copyWith(
            color: isLightMode ? AppColors.white : buttonTextColor,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getxdemo/shared/theme/app_colors.dart';

class SocialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String path;

  const SocialButton({
    Key? key,
    this.onPressed,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: 50,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.colorF7F7FF.withOpacity(
              0.9,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.colorF7F7FF,
            ),
          ),
          child: SvgPicture.asset(path)),
    );
  }
}

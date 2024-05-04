import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/shared/theme/app_colors.dart';
import 'package:getxdemo/shared/theme/text_styles.dart';
import 'package:getxdemo/views/screens/intro/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.to(
        () => const OnboardingPage(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Center(
          child: Text(
            'Test App',
            style: TextStyles.bold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

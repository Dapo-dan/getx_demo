import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/shared/helpers/ui_helpers.dart';
import 'package:getxdemo/shared/theme/app_colors.dart';
import 'package:getxdemo/shared/theme/text_styles.dart';
import 'package:getxdemo/shared/utils/image_path.dart';
import 'package:getxdemo/views/screens/auth/signup_page.dart';
import 'package:getxdemo/views/widgets/buttons/app_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> pageTexts = [
    'Book an appointment with doctor. Chat with doctor via appointment letter and get consultation.',
    'Plan your wellness journey with us. Experience hassle-free consultations and personalized guidance.',
    'Unlock access to premium healthcare. Seamlessly connect with our team for top-notch medical advice and support.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth(context),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Stack(
              children: [
                Image.asset(
                  ImagePath.bgTexture,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceMedium,
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              AppColors.white,
                              AppColors.white.withOpacity(0.5),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Text(
                          'HealTec',
                          style: TextStyles.bold,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImagePath.onboarding,
                          height: screenHeight(context) * 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight(context) * 0.36,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(
                    10,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'More Comfortable Chat With the Doctor',
                    style: TextStyles.bold.copyWith(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.11,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: pageTexts.length,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  pageTexts[index],
                                  textStyle: const TextStyle(
                                    fontSize: 17.0,
                                    color: AppColors.text,
                                  ),
                                  speed: const Duration(milliseconds: 50),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                              repeatForever: false,
                              totalRepeatCount: 1,
                              pause: const Duration(milliseconds: 20),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pageTexts.length,
                      (index) => _buildPageIndicator(index),
                    ),
                  ),
                  verticalSpaceSmall,
                  AppButton(
                    onTap: _currentPage < 2
                        ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          }
                        : () => Get.to(const SignUpPage()),
                    buttonText: _currentPage < 2 ? 'Next' : 'Get Started',
                    buttonTextColor: AppColors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    return Container(
      height: 8.0,
      width: _currentPage == index ? 24.0 : 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: _currentPage == index
            ? AppColors.primaryColor
            : AppColors.colorDFE0F3,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

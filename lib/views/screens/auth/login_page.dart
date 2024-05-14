import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/auth/login_controller.dart';
import 'package:getxdemo/shared/helpers/ui_helpers.dart';
import 'package:getxdemo/shared/theme/app_colors.dart';
import 'package:getxdemo/shared/theme/text_styles.dart';
import 'package:getxdemo/shared/utils/icon_path.dart';
import 'package:getxdemo/views/widgets/buttons/app_button.dart';
import 'package:getxdemo/views/widgets/buttons/social_button.dart';
import 'package:getxdemo/views/widgets/divide_with_text.dart';
import 'package:getxdemo/views/widgets/text_input_fields/app_text_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge,
                Text(
                  'Login',
                  style: TextStyles.bold.copyWith(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpaceSmall,
                Text(
                  'Welcome Back',
                  style: TextStyles.regular.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpaceSmall,
                Row(
                  children: [
                    Text(
                      'Login with:',
                      style: TextStyles.regular.copyWith(
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    horizontalSpaceMedium,
                    SocialButton(
                      path: IconPath.twitter,
                      onPressed: () {},
                    ),
                    horizontalSpaceMedium,
                    SocialButton(
                      path: IconPath.facebook,
                      onPressed: () {},
                    ),
                  ],
                ),
                verticalSpaceSmall,
                const DivideWithText(
                  text: "OR",
                  color: AppColors.hint,
                ),
                verticalSpaceSmall,
                Text(
                  'Email*',
                  style: TextStyles.regular.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppTextField(
                  hintText: 'Enter email address',
                  controller: controller.emailTC,
                  validator: (val) {
                    return controller.validateEmail(val);
                  },
                ),
                verticalSpaceSmall,
                Text(
                  'Password*',
                  style: TextStyles.regular.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppTextField(
                  hintText: 'Enter password',
                  ispassword: true,
                  inputFieldType: InputFieldType.password,
                  controller: controller.passwordTC,
                  validator: (val) {
                    return controller.validatePassword(val);
                  },
                ),
                verticalSpaceLarge,
                Obx(
                  () => AppButton(
                    isLoading: controller.status.isLoading,
                    onTap: () {
                      controller.onLogin();
                    },
                    buttonText: 'Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:getxdemo/shared/helpers/ui_helpers.dart';
import 'package:getxdemo/shared/theme/app_colors.dart';
import 'package:getxdemo/shared/theme/text_styles.dart';
import 'package:getxdemo/shared/utils/icon_path.dart';
import 'package:getxdemo/views/widgets/buttons/app_button.dart';
import 'package:getxdemo/views/widgets/buttons/social_button.dart';
import 'package:getxdemo/views/widgets/divide_with_text.dart';
import 'package:getxdemo/views/widgets/text_input_fields/app_text_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailTC = TextEditingController();
  final phoneTC = TextEditingController();
  final firstNameTC = TextEditingController();
  final lastNameTC = TextEditingController();
  final passwordTC = TextEditingController();
  final confirmpassTC = TextEditingController();
  final formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceLarge,
            Text(
              'Sign Up',
              style: TextStyles.bold.copyWith(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpaceSmall,
            Text(
              'Fill in your information to get started',
              style: TextStyles.regular.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpaceSmall,
            Row(
              children: [
                Text(
                  'Sign up with:',
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
              controller: emailTC,
            ),
            verticalSpaceSmall,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First name*',
                        style: TextStyles.regular.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      AppTextField(
                        hintText: 'Enter first name',
                        controller: firstNameTC,
                      ),
                    ],
                  ),
                ),
                horizontalSpaceMedium,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last name*',
                        style: TextStyles.regular.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      AppTextField(
                        hintText: 'Enter last name',
                        controller: lastNameTC,
                      ),
                    ],
                  ),
                ),
              ],
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
              controller: passwordTC,
            ),
            verticalSpaceSmall,
            Text(
              'Confirm Password*',
              style: TextStyles.regular.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            AppTextField(
              hintText: 'Enter password',
              controller: confirmpassTC,
            ),
            verticalSpaceLarge,
            AppButton(
              onTap: () {},
              buttonText: 'Proceed',
            )
          ],
        ),
      ),
    );
  }
}

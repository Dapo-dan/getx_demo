import 'package:flutter/material.dart';
import 'package:getxdemo/shared/helpers/ui_helpers.dart';
import 'package:getxdemo/shared/theme/text_styles.dart';
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
            Text(
              'Fill in your information to get started',
              style: TextStyles.regular.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            Text(
              'Email*',
              style: TextStyles.regular.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            AppTextField(),
            Text(
              'Phone number*',
              style: TextStyles.regular.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

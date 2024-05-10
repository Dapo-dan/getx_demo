// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getxdemo/shared/theme/app_colors.dart';

enum InputFieldType { normal, password, email, name }

class AppTextField extends StatefulWidget {
  const AppTextField({
    this.controller,
    this.autofocus = false,
    this.hintText,
    this.inputAction,
    this.errorText,
    this.inputType,
    this.isEnabled,
    this.isFilled,
    this.horizontalPadding = 20,
    this.borderRadius = 8,
    this.verticalPadding = 16,
    this.maxLength,
    this.maxLines,
    this.onChanged,
    this.inputFormatter,
    this.inputFieldType = InputFieldType.normal,
    this.suffixIcon,
    this.prefixIconPath = "",
    this.inputErrorOccur = false,
    this.ispassword = false,
    this.fieldKey,
    this.validator,
    super.key,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool ispassword;
  final bool? isFilled;
  final bool inputErrorOccur;
  final String? Function(String?)? validator;
  final Function(String value)? onChanged;
  final bool autofocus;
  final int? maxLines;
  final int? maxLength;
  final bool? isEnabled;
  final String? errorText;
  final InputFieldType inputFieldType;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final String prefixIconPath;
  final double horizontalPadding, borderRadius;
  final double verticalPadding;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixIcon;
  final Key? fieldKey;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showpassword = true;

  String? handleErrorText() {
    switch (widget.inputFieldType) {
      case InputFieldType.normal:
        return null;
      case InputFieldType.email:
        return "Invalid Email address";
      case InputFieldType.password:
        return "Invalid Password";
      case InputFieldType.name:
        return "Invalid input";
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0, //, widget.horizontalPadding,
        vertical: widget.verticalPadding,
      ),
      child: TextFormField(
        key: widget.fieldKey,
        cursorColor: Colors.black,
        validator: widget.validator,
        controller: widget.controller,
        autofocus: widget.autofocus,
        enabled: widget.isEnabled,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines ?? 1,
        textInputAction: widget.inputAction ?? TextInputAction.next,
        obscureText: widget.ispassword ? showpassword : false,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        keyboardType: widget.inputType,
        textCapitalization: TextCapitalization.sentences,
        inputFormatters: widget.inputFormatter,
        decoration: InputDecoration(
          semanticCounterText: widget.hintText,
          fillColor: AppColors.colorF7F7FF,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          // prefixIcon: widget.prefixIconPath != ""
          //     ? Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //         child: SvgPicture.asset(
          //           widget.prefixIconPath,
          //           width: 2,
          //           height: 24,
          //         ),
          //       )
          //     : null,
          prefixIconConstraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
          suffixIcon: widget.suffixIcon ??
              (widget.inputFieldType == InputFieldType.password
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          showpassword = !showpassword;
                        });
                      },
                      child: Icon(
                        showpassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                        semanticLabel:
                            showpassword ? 'Show Password' : 'Hide Password',
                      ),
                    )
                  : const SizedBox()),
          hintStyle: textTheme.labelSmall,
          hintText: widget.hintText,
          filled: true,
          errorText: widget.inputErrorOccur
              ? widget.errorText ?? handleErrorText()
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: colorScheme.primaryContainer,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: colorScheme.primaryContainer,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

// class PhoneNumberTextField extends StatelessWidget {
//   const PhoneNumberTextField({
//     super.key,
//     this.phoneController,
//     this.onChanged,
//     this.onInputValidate,
//     this.inputErrorOccur = false,
//   });

//   final bool inputErrorOccur;
//   final TextEditingController? phoneController;
//   final Function(String value)? onChanged;
//   final Function(bool value)? onInputValidate;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: InputDecorator(
//         decoration: InputDecoration(
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24),
//             borderSide: const BorderSide(
//               color: AppColors.lightGrey6,
//               width: 1,
//             ),
//           ),
//           errorText: inputErrorOccur ? "Invalid Phone number" : null,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24),
//             borderSide: const BorderSide(
//               color: AppColors.lightGrey6,
//               width: 1,
//             ),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24),
//             borderSide: const BorderSide(
//               color: AppColors.red6,
//               width: 1,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24),
//             borderSide: const BorderSide(
//               color: AppColors.lightGrey6,
//               width: 1,
//             ),
//           ),
//         ),
//         child: InternationalPhoneNumberInput(
//           onInputChanged: (PhoneNumber number) {
//             if (kDebugMode) {
//               print(number.phoneNumber);
//             }
//             if (onChanged != null) {
//               onChanged!(number.phoneNumber.toString());
//             }
//           },
//           onInputValidated: (bool value) {
//             if (kDebugMode) {
//               print(value);
//             }
//             if (onInputValidate != null) {
//               onInputValidate!(value);
//             }
//           },
//           ignoreBlank: true,
//           autoValidateMode: AutovalidateMode.disabled,
//           locale: 'NG',
//           textFieldController: phoneController,
//           inputBorder: InputBorder.none,
//           selectorConfig: const SelectorConfig(
//             selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//           ),
//         ),
//       ),
//     );
//   }
// }

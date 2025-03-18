import 'package:flutter/material.dart';

import '../../../../../core/theaming/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.onTap,
      required this.centerWidget,
      required this.text});

  final void Function() onTap;
  final Widget centerWidget;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
        widget: centerWidget is Text
            ? Text(
                text!,
                style: Styles.textStyleWhite14,
              )
            : centerWidget,
        onTap: onTap);
  }
}

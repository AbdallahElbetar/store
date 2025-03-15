import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, error, info, warning }

void showCustomSnackBar({
  required String message,
  required BuildContext context,
  required SnackBarType type,
}) {
  AnimatedSnackBarType animatedType;

  switch (type) {
    case SnackBarType.success:
      animatedType = AnimatedSnackBarType.success;
      break;
    case SnackBarType.error:
      animatedType = AnimatedSnackBarType.error;
      break;
    case SnackBarType.info:
      animatedType = AnimatedSnackBarType.info;
      break;
    case SnackBarType.warning:
      animatedType = AnimatedSnackBarType.warning;
      break;
  }

  AnimatedSnackBar.material(
    message,
    type: animatedType,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
  ).show(context);
}

import 'package:flutter/material.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/utils/colors.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/utils/enums.dart';

class SnackBarHelper {
  static void show(BuildContext context, String message, {SnackBarType type = SnackBarType.info}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: _configColor(type),
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Text(message, textAlign: TextAlign.right),
      ),
    ));
  }

  static void showWithAction(
      {required BuildContext context,
      required String message,
      required String actionLabel,
      required VoidCallback onAction,
      SnackBarType type = SnackBarType.info}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: _configColor(type),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onAction,
            child: Text(actionLabel, style: const TextStyle(color: Colors.yellow)),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              message,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    ));
  }

  static Color _configColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.info:
        return color555770;
      case SnackBarType.success:
        return colorDarkGreen;
      case SnackBarType.error:
        return colorRed;
    }
  }
}

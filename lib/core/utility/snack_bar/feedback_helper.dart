import 'package:flutter/material.dart';
import 'package:travela_assignment/core/utility/snack_bar/custom_snackbar.dart';
import 'package:travela_assignment/core/utility/snack_bar/top_snack_bar.dart';

enum FeedbackType { info, success, error, alert }

class FeedBackHelper {
  static void showSnackBar({
    required BuildContext context,
    required String title,
    EdgeInsetsGeometry? margin,
    int maxLines = 2,
    FeedbackType type = FeedbackType.info,
  }) {
    showTopSnackBar(
      dismissType: DismissType.onSwipe,
      Overlay.of(context),
      (type == FeedbackType.info)
          ? CustomSnackBar.info(
              message: title,
              maxLines: maxLines,
            )
          : (type == FeedbackType.success)
              ? CustomSnackBar.success(
                  message: title,
                  maxLines: maxLines,
                )
              : (type == FeedbackType.alert)
                  ? CustomSnackBar.alert(
                      message: title,
                      maxLines: maxLines,
                    )
                  : (type == FeedbackType.success)
                      ? CustomSnackBar.success(
                          message: title,
                          maxLines: maxLines,
                        )
                      : CustomSnackBar.error(
                          message: title,
                          maxLines: maxLines,
                        ),
    );
  }

  static Future<bool> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async =>
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                child: const Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        },
      ).then((value) {
        return value;
      });
}

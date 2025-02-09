import 'package:flutter/cupertino.dart';

import 'common_error.dart';
import 'no_internet_connection.dart';

class ErrorHandlerUi extends StatelessWidget {
  final String errorMessage;
  final String errorStatus;
  final int errorCode;
  final Function()? noInternetOnTap;
  final bool? showInternetError;

  const ErrorHandlerUi({
    super.key,
    required this.errorMessage,
    required this.errorCode,
    required this.noInternetOnTap,
    required this.errorStatus,
    this.showInternetError,
  });

  @override
  Widget build(BuildContext context) {
    if (errorStatus == 'no_internet_error') {
      if (showInternetError != null) {
        return NoInternetConnection(
          onTap: noInternetOnTap!,
        );
      }else{
        return const SizedBox.shrink();
      }

    } else {
      return CommonError(
        code: errorCode.toString(),
        status: errorStatus,
        message: errorMessage,
      );
    }
  }
}

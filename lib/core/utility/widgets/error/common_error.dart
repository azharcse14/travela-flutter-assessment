import 'package:flutter/material.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';

import '../../../utility/constants/app_spacing.dart';
import '../../../utility/constants/font_manager.dart';
import '../../../utility/constants/style_manager.dart';
import '../../../utility/constants/values_manager.dart';

class CommonError extends StatelessWidget {
  final String code;
  final String status;
  final String message;

  const CommonError({
    super.key,
    required this.code,
    required this.status,
    required this.message,
  });

  bool get _shouldShowCode => code.isNotEmpty && code != '0';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_shouldShowCode) ...[
            _buildCodeText(),
            AppSpacing.verticalSpacing8,
          ],
          _buildStatusText(),
          AppSpacing.verticalSpacing8,
          _buildMessageText(),
          AppSpacing.verticalSpacing16,
        ],
      ),
    );
  }

  /// Builds the error code text
  Widget _buildCodeText() {
    return Text(
      code,
      style: getBoldStyle(
        fontSize: 100,
      ),
    );
  }

  /// Builds the status text
  Widget _buildStatusText() {
    return Text(
      status,
      style: getBoldStyle(
        fontSize: FontSize.s18,
      ),
    );
  }

  /// Builds the message text
  Widget _buildMessageText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p60),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: getRegularStyle(
          color: ColorManager.colorBackgroundDark,
        ),
      ),
    );
  }
}

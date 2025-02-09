import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/font_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/constants/values_manager.dart';

class NoDataAvailable extends StatelessWidget {
  final String? title;
  final String? description;
  final String? icon;
  final bool isAppBarShown;

  const NoDataAvailable({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.isAppBarShown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageAssets.noDataAvailableIcon,
                  height: AppSize.s100,
                  width: AppSize.s100,
                ),
                AppSpacing.verticalSpacing24,
                Text(
                  title ?? 'No data available',
                  style: getBoldStyle(
                    fontSize: FontSize.s18,
                  ),
                ),
                AppSpacing.verticalSpacing8,
                Text(
                  textAlign: TextAlign.center,
                  description ?? 'There is no data to show you right now.',
                  style: getRegularStyle(
                    color: ColorManager.kTextGrayColor,
                  ),
                ),
              ],
            ),
          );
  }
}

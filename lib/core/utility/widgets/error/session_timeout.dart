import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/font_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/constants/values_manager.dart';

class SessionTimeout extends StatelessWidget {
  const SessionTimeout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImageAssets.sessionTimeoutIcon, height: AppSize.s100, width: AppSize.s100,fit: BoxFit.cover,),
          AppSpacing.verticalSpacing24,
          Text('Session Timeout', style: getBoldStyle(fontSize: FontSize.s18,),),
          AppSpacing.verticalSpacing8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p42),
            child: Text(
              'Your session has timed out due to inactivity.\nPlease try again',
              textAlign: TextAlign.center,
              style: getRegularStyle(
                color: ColorManager.kTextGrayColor,
              ),
            ),
          ),
          AppSpacing.verticalSpacing24,
          // KLoadingButton(
          //   borderRadiusBottomLeft: AppRadius.r8,
          //   borderRadiusBottomRight: AppRadius.r8,
          //   borderRadiusTopLeft: AppRadius.r8,
          //   borderRadiusTopRight: AppRadius.r8,
          //   title: 'Try Again',
          //   onPressed: () {},
          //   width: 150,
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/font_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/constants/values_manager.dart';

class NoInternetConnection extends StatelessWidget {
  
  final Function() onTap;
  const NoInternetConnection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImageAssets.noInternetConnectionIcon, height: AppSize.s100, width: AppSize.s100,fit: BoxFit.cover,),
          AppSpacing.verticalSpacing24,
          Text('Ooops!', style: getBoldStyle(fontSize: FontSize.s18,),),
          AppSpacing.verticalSpacing8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p42),
            child: Text(
              'No internet connection was found. Please check your connection and try again.',
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
          //   onPressed: onTap,
          //   width: 150,
          // ),
        ],
      ),
    );
  }
}

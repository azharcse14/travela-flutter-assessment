import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/font_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/constants/values_manager.dart';


class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImageAssets.noDataFoundIcon, height: AppSize.s100, width: AppSize.s100,fit: BoxFit.cover,),
          AppSpacing.verticalSpacing16,
          Text('No data found', style: getRegularStyle(fontSize: FontSize.s18,),),
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
          // AppSpacing.verticalSpacing16,
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     'Go Back',
          //     style: getRegularStyle(
          //       color: k6B7386,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

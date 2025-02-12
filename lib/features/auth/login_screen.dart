import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/widgets/con_rich_txt.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  final Function(bool?) onResult;

  const LoginScreen({super.key, required this.onResult});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(ImageAssets.loginTopBannerImage),
              AppSpacing.verticalSpacing20,
              ConRichTxt(
                prefixTxt: 'Welcome to ',
                prefixWeight: FontWeight.w600,
                prefixFont: 24,
                prefixClr: ColorManager.kTextBlackColor,
                suffixTxt: 'Travela',
                suffixWeight: FontWeight.w600,
                suffixFont: 24,
                suffixClr: ColorManager.kBaseColor,
              ),
              AppSpacing.verticalSpacing8,
              Text(
                'Insert your phone number to continue',
                style: getRegularStyle(color: ColorManager.kTextGrayColor),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

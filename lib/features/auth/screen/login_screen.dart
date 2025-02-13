import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/widgets/con_rich_txt.dart';
import 'package:travela_assignment/features/auth/widgets/dial_code_picker/custom_phone_field.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  final Function(bool?) onResult;

  const LoginScreen({super.key, required this.onResult});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusNode = FocusNode();
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
              AppSpacing.verticalSpacing8,
              CustomPhoneField(
                focusNode: focusNode,
                textAlignVertical: TextAlignVertical.top,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  counterText: '',
                  labelText: 'Phone Number',
                  // hintText: '182000000',
                  border: InputBorder.none, // No visible border
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0), // No visible border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0), // No visible border when enabled
                  ),
                  contentPadding: EdgeInsets.only(top: 0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                ),
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

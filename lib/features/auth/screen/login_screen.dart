import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/snack_bar/feedback_helper.dart';
import 'package:travela_assignment/core/utility/widgets/con_rich_txt.dart';
import 'package:travela_assignment/features/auth/widgets/dial_code_picker/custom_phone_field.dart';
import 'package:travela_assignment/features/auth/widgets/dial_code_picker/phone_number.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  final Function(bool?) onResult;

  const LoginScreen({super.key, required this.onResult});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode = FocusNode();
  PhoneNumber? _phoneNumber;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
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
              AppSpacing.verticalSpacing24,
              CustomPhoneField(
                focusNode: _focusNode,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: ColorManager.kBaseColor,
                decoration: InputDecoration(
                  counterText: '',
                  // labelText: 'xxxx-xxxx',
                  // labelStyle: getMediumStyle(),
                  hintText: 'xxxx-xxxx',
                  hintStyle: getMediumStyle(),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0), // No visible border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0), // No visible border when enabled
                  ),
                  contentPadding: EdgeInsets.only(top: 0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                ),
                style: getMediumStyle(),
                dropdownTextStyle: getMediumStyle(color: ColorManager.kTextGrayColor),
                onChanged: (phone) {
                  _phoneNumber = phone;
                },
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              AppSpacing.verticalSpacing50,
              InkWell(
                onTap: (){
                  if(_phoneNumber==null){
                    FeedBackHelper.showSnackBar(context: context, title: 'Please Enter Your Phone Number', type: FeedbackType.info,);
                    return;
                  }

                  if(_phoneNumber!.numberLengthValidation == 'short'){
                    FeedBackHelper.showSnackBar(context: context, title: 'Please Enter Your Valid Phone Number', type: FeedbackType.info,);
                    return;
                  }

                  if(_phoneNumber?.completeNumber!='+8801824752549'){
                    FeedBackHelper.showSnackBar(context: context, title: 'Please Enter Your Registered Phone Number', type: FeedbackType.error,);
                    return;
                  }
                  FeedBackHelper.showSnackBar(
                    context: context,
                    title: 'Login Successfully!',
                    type: FeedbackType.success,
                  );
                  widget.onResult(true);


                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorManager.kBaseColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Continue',
                          style: getSemiBoldStyle(color: ColorManager.colorWhite),
                        ),
                        SvgPicture.asset('assets/images/right_arrow.svg')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/font_manager.dart';

class ConRichTxt extends StatelessWidget {
  final String prefixTxt;
  final String suffixTxt;
  final double? prefixFont;
  final double? suffixFont;
  final Color? prefixClr;
  final Color? suffixClr;
  final FontWeight? suffixWeight;
  final FontWeight? prefixWeight;

  const ConRichTxt({
    super.key,
    required this.prefixTxt,
    required this.suffixTxt,
    this.prefixClr,
    this.suffixClr,
    this.suffixWeight,
    this.prefixWeight,
    this.prefixFont,
    this.suffixFont,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: prefixTxt,
        style: TextStyle(
          fontSize: prefixFont ?? FontSize.s14,
          color: prefixClr ?? ColorManager.kTextBlackColor,
          fontWeight: prefixWeight ?? FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: suffixTxt,
            style: TextStyle(
              fontSize: suffixFont ?? FontSize.s14,
              color: suffixClr??ColorManager.kTextBlackColor,
              fontWeight: suffixWeight ?? FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

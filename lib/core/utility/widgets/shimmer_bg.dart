import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/values_manager.dart';


class ShimmerBg extends StatelessWidget {
  const ShimmerBg({
    super.key,
    this.width = AppSize.s120,
    this.height = 25,
    this.radius = AppRadius.r10,
    this.color,
  });

  final double? width;
  final double? height;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // baseColor: kLightGreyColor,
      baseColor: ColorManager.kHighlightShimmerColor,
      highlightColor: ColorManager.kBaseShimmerColor,
      // highlightColor: kGreyColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppRadius.r18),
          color: color ?? ColorManager.kLightGreyColor,
        ),
      ),
    );
  }
}
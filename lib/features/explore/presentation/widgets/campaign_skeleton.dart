import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/screen_size.dart';
import 'package:travela_assignment/core/utility/constants/values_manager.dart';
import 'package:travela_assignment/core/utility/widgets/shimmer_bg.dart';

class CampaignSkeleton extends StatelessWidget {
  final bool isTab;
  const CampaignSkeleton({super.key, required this.isTab});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.kBaseShimmerColor,
      highlightColor: ColorManager.kHighlightShimmerColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (isTab) _buildTabSkeleton(context),
            _buildListSkeleton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSkeleton(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ShimmerBg(
            height: 54,
            radius: 100,
            color: ColorManager.colorWhite,
            width: screenMaxWidth(context: context),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => AppSpacing.horizontalSpacing16,
            itemBuilder: (context, index) => _buildTabItemSkeleton(),
          ),
        ),
        AppSpacing.verticalSpacing16,
      ],
    );
  }

  Widget _buildTabItemSkeleton() {
    return Column(
      children: [
        ShimmerBg(
          height: 32,
          radius: AppRadius.r4,
          color: ColorManager.colorWhite,
          width: 32,
        ),
        AppSpacing.verticalSpacing16,
        ShimmerBg(
          height: 16,
          radius: AppRadius.r4,
          color: ColorManager.colorWhite,
          width: 38,
        ),
      ],
    );
  }

  Widget _buildListSkeleton(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => _buildListItemSkeleton(context),
      separatorBuilder: (context, index) => AppSpacing.verticalSpacing16,
    );
  }

  Widget _buildListItemSkeleton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ShimmerBg(
            height: MediaQuery.of(context).size.width,
            radius: AppRadius.r24,
            color: ColorManager.colorWhite,
            width: MediaQuery.of(context).size.width,
          ),
          AppSpacing.verticalSpacing16,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextSkeleton(context),
                    AppSpacing.verticalSpacing12,
                    _buildTextSkeleton(context),
                  ],
                ),
              ),
              AppSpacing.horizontalSpacing16,
              _buildIconSkeleton(),
              AppSpacing.horizontalSpacing4,
              _buildIconSkeleton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTextSkeleton(BuildContext context) {
    return ShimmerBg(
      height: 16,
      radius: AppRadius.r4,
      color: ColorManager.colorWhite,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _buildIconSkeleton() {
    return ShimmerBg(
      height: 16,
      radius: AppRadius.r4,
      color: ColorManager.colorWhite,
      width: 16,
    );
  }
}


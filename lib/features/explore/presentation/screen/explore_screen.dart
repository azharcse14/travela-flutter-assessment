import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travela_assignment/core/di/di_import_path.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/widgets/custom_image.dart';
import 'package:travela_assignment/core/utility/widgets/error/error_handler_ui.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaigns_entity.dart';
import 'package:travela_assignment/features/explore/presentation/manager/campaigns/campaigns_bloc.dart';
import 'package:travela_assignment/features/explore/presentation/manager/campaigns_item_list/campaigns_item_list_bloc.dart';

import '../widgets/campaign_skeleton.dart';
import '../pages/campaign_item_page.dart';

@RoutePage()
class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final campaignsItemListBloc = injector<CampaignsItemListBloc>();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: campaignsItemListBloc,
      child: Scaffold(
        backgroundColor: ColorManager.colorWhite,
        body: SafeArea(
          child: BlocBuilder<CampaignsBloc, CampaignsState>(
            builder: (context, state) {
              if (state is CampaignsLoading) {
                return const CampaignSkeleton(isTab: true);
              } else if (state is CampaignsError) {
                return _buildErrorWidget(context, state);
              } else if (state is CampaignsSuccess) {
                return _buildSuccessContent(context, state);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, CampaignsError state) {
    return ErrorHandlerUi(
      errorMessage: state.errorMessage,
      errorCode: state.errorCode,
      showInternetError: true,
      noInternetOnTap: (){
        injector<CampaignsBloc>().add(const GetCampaigns());
      },
      errorStatus: state.errorStatus,
    );
  }

  Widget _buildSuccessContent(BuildContext context, CampaignsSuccess state) {
    var data = state.campaignsEntity.data;
    campaignsItemListBloc.add(GetCampaignsItemList(campaignId: data[0].id));

    return DefaultTabController(
      length: data.length,
      child: Column(
        children: [
          _buildSearchBar(),
          _buildTabBar(data),
          Expanded(child: _buildTabBarView(data)),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorManager.colorWhite,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: SizedBox(
          height: 72,
          child: Row(
            children: [
              AppSpacing.horizontalSpacing16,
              SvgPicture.asset(ImageAssets.searchIcon),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: getSemiBoldStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TabBar _buildTabBar(List<CampaignsDataEntity> data) {
    return TabBar(
      padding: EdgeInsets.zero,
      labelColor: ColorManager.kTextBlackColor,
      labelStyle: getSemiBoldStyle(color: ColorManager.kTextBlackColor),
      indicatorSize: TabBarIndicatorSize.label,
      tabAlignment: TabAlignment.start,
      unselectedLabelColor: ColorManager.kTextGrayColor,
      unselectedLabelStyle: getSemiBoldStyle(color: ColorManager.kTextGrayColor),
      indicatorColor: ColorManager.kTextBlackColor,
      dividerColor: Colors.transparent,
      isScrollable: true,
      tabs: data.map((item) => _buildTab(item)).toList(),
      onTap: (index) => campaignsItemListBloc.add(
        GetCampaignsItemList(campaignId: data[index].id),
      ),
    );
  }

  Tab _buildTab(CampaignsDataEntity item) {
    return Tab(
      icon: CustomImage(
        imgUrl: item.image,
        imgWidth: 32,
        imgHeight: 32,
        borderRadius: 8,
      ),
      text: item.title,
    );
  }

  Widget _buildTabBarView(List<CampaignsDataEntity> values) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: values.map((item) => CampaignItemPage(campaignId: item.id)).toList(),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travela_assignment/core/di/di_import_path.dart';
import 'package:travela_assignment/core/utility/constants/app_spacing.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/widgets/custom_image.dart';
import 'package:travela_assignment/core/utility/widgets/error/error_handler_ui.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaign_item_list_entity.dart';
import 'package:travela_assignment/features/explore/presentation/manager/campaigns_item_list/campaigns_item_list_bloc.dart';
import 'package:travela_assignment/features/explore/presentation/widgets/campaign_skeleton.dart';

class CampaignItemPage extends StatefulWidget {
  final int campaignId;

  const CampaignItemPage({super.key, required this.campaignId});

  @override
  State<CampaignItemPage> createState() => _CampaignItemPageState();
}

class _CampaignItemPageState extends State<CampaignItemPage> {
  final campaignsItemListBloc = injector<CampaignsItemListBloc>();
  final ScrollController _scrollController = ScrollController();
  final StreamController<void> _scrollDebounce = StreamController<void>();
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _initScrollListener();
  }

  void _initScrollListener() {
    _scrollDebounce.stream.listen((_) async {
      await Future.delayed(const Duration(milliseconds: 200));
      campaignsItemListBloc.add(
        LoadMoreCampaignsItemList(campaignId: widget.campaignId),
      );
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && campaignsItemListBloc.hasMore) {
        _scrollDebounce.add(null);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollDebounce.close();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    campaignsItemListBloc.add(
      GetCampaignsItemList(campaignId: widget.campaignId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManager.kBaseColor,
      key: _refreshIndicatorKey,
      onRefresh: _onRefresh,
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFf2f0f0), ColorManager.colorWhite],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocBuilder<CampaignsItemListBloc, CampaignsItemListState>(
          builder: (context, state) {
            if (state is CampaignsItemListLoading) {
              return const CampaignSkeleton(isTab: false);
            } else if (state is CampaignsItemListError) {
              return _buildErrorUi(state);
            } else if (state is CampaignsItemListSuccess) {
              return _buildCampaignList(state);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _buildErrorUi(CampaignsItemListError state) {
    return ErrorHandlerUi(
      errorMessage: state.errorMessage,
      errorCode: state.errorCode,
      showInternetError: true,
      noInternetOnTap: _onRefresh,
      errorStatus: state.errorStatus,
    );
  }

  Widget _buildCampaignList(CampaignsItemListSuccess state) {
    var data = state.campaignsItemListEntity.data;
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) => _buildCampaignItem(data[index]),
            separatorBuilder: (context, index) => AppSpacing.verticalSpacing16,
          ),
          if (campaignsItemListBloc.hasMore) _buildLoadMoreLoader(),
          AppSpacing.verticalSpacing8,
        ],
      ),
    );
  }

  Widget _buildCampaignItem(CampaignItemListDataEntity data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            imgUrl: data.images.first.url,
            imgHeight: MediaQuery.of(context).size.width,
            borderRadius: 24,
          ),
          AppSpacing.verticalSpacing16,
          Text('Apartment in ${data.title}', style: getSemiBoldStyle(fontSize: 16)),
          AppSpacing.verticalSpacing12,
          Text('BDT ${data.price} /DAY', style: getSemiBoldStyle(fontSize: 18, color: ColorManager.kBaseColor)),
          AppSpacing.verticalSpacing12,
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: ColorManager.kTextBlackColor),
              AppSpacing.horizontalSpacing4,
              Text('${data.averageRating}', style: getSemiBoldStyle(fontSize: 16)),
              Text(' (${data.averageRating})', style: getRegularStyle(color: ColorManager.kTextGrayColor)),
            ],
          ),
          AppSpacing.verticalSpacing16,
        ],
      ),
    );
  }

  Widget _buildLoadMoreLoader() {
    return Center(
      child: CircularProgressIndicator(
        color: ColorManager.kBaseColor,
      ),
    );
  }
}


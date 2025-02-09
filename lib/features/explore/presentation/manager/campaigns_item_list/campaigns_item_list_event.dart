part of 'campaigns_item_list_bloc.dart';

sealed class CampaignsItemListEvent extends Equatable {
  const CampaignsItemListEvent();

  @override
  List<Object?> get props => [];
}

class GetCampaignsItemList extends CampaignsItemListEvent {
  final int campaignId;

  const GetCampaignsItemList({
    required this.campaignId,
  });
}

class LoadMoreCampaignsItemList extends CampaignsItemListEvent {
  final int campaignId;

  const LoadMoreCampaignsItemList({
    required this.campaignId,
  });
}

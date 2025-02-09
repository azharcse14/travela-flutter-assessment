part of 'campaigns_item_list_bloc.dart';

sealed class CampaignsItemListState extends Equatable {
  const CampaignsItemListState();

  @override
  List<Object> get props => [];
}

class CampaignsItemListInitial extends CampaignsItemListState {}

class CampaignsItemListLoading extends CampaignsItemListState {}

class MoreCampaignsItemListLoading extends CampaignsItemListState {}

class CampaignsItemListError extends CampaignsItemListState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const CampaignsItemListError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class CampaignsItemListSuccess extends CampaignsItemListState {
  final CampaignItemListEntity campaignsItemListEntity;

  const CampaignsItemListSuccess({required this.campaignsItemListEntity});
}


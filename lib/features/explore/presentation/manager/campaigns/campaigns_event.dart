part of 'campaigns_bloc.dart';

sealed class CampaignsEvent extends Equatable {
  const CampaignsEvent();
  @override
  List<Object?> get props => [];
}

class GetCampaigns extends CampaignsEvent {
  const GetCampaigns();
}

part of 'campaigns_bloc.dart';

sealed class CampaignsState extends Equatable {
  const CampaignsState();

  @override
  List<Object> get props => [];
}

class CampaignsInitial extends CampaignsState {}

class CampaignsLoading extends CampaignsState {}

class MoreCampaignsLoading extends CampaignsState {}

class CampaignsError extends CampaignsState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const CampaignsError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class CampaignsSuccess extends CampaignsState {
  final CampaignsEntity campaignsEntity;

  const CampaignsSuccess({required this.campaignsEntity});
}

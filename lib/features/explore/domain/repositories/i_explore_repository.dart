import 'package:dartz/dartz.dart';
import 'package:travela_assignment/core/network/failure.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaign_item_list_entity.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaigns_entity.dart';

abstract class IExploreRepository {

  Future<Either<Failure, CampaignsEntity>> getCampaigns();

  Future<Either<Failure, CampaignItemListEntity>> getCampaignItemList({
    required int campaignId,
    required int page,
    required int perPage,
  });

}
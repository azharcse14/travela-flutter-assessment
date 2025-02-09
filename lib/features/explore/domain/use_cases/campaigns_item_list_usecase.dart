import 'package:dartz/dartz.dart';
import 'package:travela_assignment/core/network/failure.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaign_item_list_entity.dart';
import 'package:travela_assignment/features/explore/domain/repositories/i_explore_repository.dart';

class CampaignsItemListUseCase {
  IExploreRepository iRepository;

  CampaignsItemListUseCase({required this.iRepository});

  Future<Either<Failure, CampaignItemListEntity>> call({
    required int campaignId,
    required int page,
    required int perPage,
  }) async =>
      await iRepository.getCampaignItemList(
        campaignId: campaignId,
        page: page,
        perPage: perPage,
      );
}

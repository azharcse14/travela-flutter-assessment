import 'package:dartz/dartz.dart';
import 'package:travela_assignment/core/network/error_handler.dart';
import 'package:travela_assignment/core/network/failure.dart';
import 'package:travela_assignment/core/network/network_info.dart';
import 'package:travela_assignment/features/explore/data/data_sources/i_explore_data_source.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaign_item_list_entity.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaigns_entity.dart';
import 'package:travela_assignment/features/explore/domain/repositories/i_explore_repository.dart';

class ExploreRepository extends IExploreRepository {
  final IExploreDataSource iDataSource;
  final NetworkInfo networkInfo;

  ExploreRepository({required this.iDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, CampaignsEntity>> getCampaigns() async {
    if (await networkInfo.isConnected) {
      try {
        CampaignsEntity result = await iDataSource.getCampaigns();
        return Right(result);
      } on Exception catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CampaignItemListEntity>> getCampaignItemList({
    required int campaignId,
    required int page,
    required int perPage,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        CampaignItemListEntity result = await iDataSource.getCampaignItemList(
            campaignId: campaignId, page: page, perPage: perPage);
        return Right(result);
      } on Exception catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

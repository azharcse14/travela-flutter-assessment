import 'package:dartz/dartz.dart';
import 'package:travela_assignment/core/network/failure.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaigns_entity.dart';
import 'package:travela_assignment/features/explore/domain/repositories/i_explore_repository.dart';

class CampaignsUseCase {
  IExploreRepository iRepository;

  CampaignsUseCase({required this.iRepository});

  Future<Either<Failure, CampaignsEntity>> call() async =>
      await iRepository.getCampaigns();
}

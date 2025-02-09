import 'package:travela_assignment/features/explore/data/models/campaign_item_list_model.dart';
import 'package:travela_assignment/features/explore/data/models/campaigns_model.dart';

abstract class IExploreDataSource {

  Future<CampaignsModel> getCampaigns();

  Future<CampaignItemListModel> getCampaignItemList({
    required int campaignId,
    required int page,
    required int perPage,
  });
}

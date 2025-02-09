import 'package:travela_assignment/features/explore/data/api_service/explore_api_service.dart';
import 'package:travela_assignment/features/explore/data/data_sources/i_explore_data_source.dart';
import 'package:travela_assignment/features/explore/data/models/campaign_item_list/campaign_item_list_model.dart';
import 'package:travela_assignment/features/explore/data/models/campaigns/campaigns_model.dart';

class ExploreDataSource extends IExploreDataSource {
  final ExploreApiService apiService;

  ExploreDataSource({required this.apiService});

  @override
  Future<CampaignsModel> getCampaigns() async {
    final httpResponse = await apiService.getCampaigns();

    return httpResponse.data;
  }

  @override
  Future<CampaignItemListModel> getCampaignItemList({
    required int campaignId,
    required int page,
    required int perPage,
  }) async {
    final httpResponse = await apiService.getCampaignItemList(
      campaignId: campaignId,
      page: page,
      perPage: perPage,
    );

    return httpResponse.data;
  }
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travela_assignment/core/network/api_endpoints.dart';
import 'package:travela_assignment/features/explore/data/models/campaign_item_list_model.dart';
import 'package:travela_assignment/features/explore/data/models/campaigns_model.dart';

part 'explore_api_service.g.dart';

@RestApi()
abstract class ExploreApiService {
  factory ExploreApiService(Dio dio) {
    return _ExploreApiService(dio);
  }

  @GET(APIEndPoints.kCampaignsEndPoint)
  Future<HttpResponse<CampaignsModel>> getCampaigns();

  @GET(APIEndPoints.kCampaignItemListEndPoint)
  Future<HttpResponse<CampaignItemListModel>> getCampaignItemList({
    @Path() required int campaignId,
    @Query("page") required int page,
    @Query("per_page") required int perPage,
  });

}

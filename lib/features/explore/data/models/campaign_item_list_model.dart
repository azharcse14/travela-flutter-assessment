import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaign_item_list_entity.dart';
part 'campaign_item_list_model.freezed.dart';
part 'campaign_item_list_model.g.dart';

@freezed
class CampaignItemListModel extends CampaignItemListEntity with _$CampaignItemListModel {
  const factory CampaignItemListModel({
    @JsonKey(name: "success")
    @Default(false) bool success,
    @JsonKey(name: "message")
    @Default('') String message,
    @JsonKey(name: "data")
    @Default([]) List<CampaignItemListDataModel> data,
    @JsonKey(name: "meta")
    required dynamic meta,
  }) = _CampaignItemListModel;

  factory CampaignItemListModel.fromJson(Map<String, dynamic> json) => _$CampaignItemListModelFromJson(json);
}

@freezed
class CampaignItemListDataModel extends CampaignItemListDataEntity with _$CampaignItemListDataModel {
  const factory CampaignItemListDataModel({
    @JsonKey(name: "id")
    @Default(0) int id,
    @JsonKey(name: "title")
    @Default('') String title,
    @JsonKey(name: "place_type")
    @Default('') String placeType,
    @JsonKey(name: "address")
    @Default('') String address,
    @JsonKey(name: "max_guest")
    @Default(0) int maxGuest,
    @JsonKey(name: "max_child")
    @Default(0) int maxChild,
    @JsonKey(name: "max_infant")
    @Default(0) int maxInfant,
    @JsonKey(name: "min_nights")
    @Default(0) int minNights,
    @JsonKey(name: "free_guest")
    @Default(0) int freeGuest,
    @JsonKey(name: "bedroom")
    @Default(0) int bedroom,
    @JsonKey(name: "beds")
    @Default(0) int beds,
    @JsonKey(name: "bathroom")
    @Default(0) int bathroom,
    @JsonKey(name: "price")
    @Default(0) int price,
    @JsonKey(name: "weekend_price")
    @Default(0) int weekendPrice,
    @JsonKey(name: "per_guest_amount")
    @Default(0) int perGuestAmount,
    @JsonKey(name: "check_in")
    @Default('') String checkIn,
    @JsonKey(name: "check_out")
    @Default('') String checkOut,
    @JsonKey(name: "description")
    @Default('') String description,
    @JsonKey(name: "average_rating")
    @Default(0) int averageRating,
    @JsonKey(name: "average_response")
    @Default(0) int averageResponse,
    @JsonKey(name: "total_average")
    @Default(0) int totalAverage,
    @JsonKey(name: "commission_rate")
    @Default(0) int commissionRate,
    @JsonKey(name: "commission_expired_date")
    @Default('') String commissionExpiredDate,
    @JsonKey(name: "custom_min_commission")
    required dynamic customMinCommission,
    @JsonKey(name: "custom_commission")
    required dynamic customCommission,
    @JsonKey(name: "instant_booking_type")
    @Default('') String instantBookingType,
    @JsonKey(name: "instant_booking_from")
    @Default('') String instantBookingFrom,
    @JsonKey(name: "instant_booking_to")
    @Default('') String instantBookingTo,
    @JsonKey(name: "instant_booking_message")
    @Default('') String instantBookingMessage,
    @JsonKey(name: "total_count")
    @Default(0) int totalCount,
    @JsonKey(name: "showable_price")
    @Default(0) int showablePrice,
    @JsonKey(name: "type")
    @Default('') String type,
    @JsonKey(name: "advance")
    @Default('') String advance,
    @JsonKey(name: "commission")
    @Default(0) int commission,
    @JsonKey(name: "before_discount")
    required dynamic beforeDiscount,
    @JsonKey(name: "average_price")
    required dynamic averagePrice,
    @JsonKey(name: "status")
    @Default('') String status,
    @JsonKey(name: "images")
    @Default([]) List<Image> images,
    @JsonKey(name: "reviews_count")
    @Default(0) int reviewsCount,
    @JsonKey(name: "reviews_avg")
    @Default(0) int reviewsAvg,
    @JsonKey(name: "hotel")
    required dynamic hotel,
    @JsonKey(name: "created_at")
    required DateTime createdAt,
    @JsonKey(name: "location")
    required Location location,
    @JsonKey(name: "property_type")
    required PropertyType propertyType,
    @JsonKey(name: "rank")
    required Rank rank,
    @JsonKey(name: "host")
    required Host host,
    @JsonKey(name: "cancellation")
    required Cancellation cancellation,
  }) = _CampaignItemListDataModel;

  factory CampaignItemListDataModel.fromJson(Map<String, dynamic> json) => _$CampaignItemListDataModelFromJson(json);
}

@freezed
class Cancellation extends CancellationEntity with _$Cancellation {
  const factory Cancellation({
    @JsonKey(name: "body")
    @Default('') String body,
    @JsonKey(name: "title")
    @Default('') String title,
    @JsonKey(name: "for_host")
    @Default('') String forHost,
    @JsonKey(name: "day")
    @Default(0) int day,
  }) = _Cancellation;

  factory Cancellation.fromJson(Map<String, dynamic> json) => _$CancellationFromJson(json);
}

@freezed
class Host extends HostEntity with _$Host {
  const factory Host({
    @JsonKey(name: "id")
    @Default(0) int id,
    @JsonKey(name: "first_name")
    @Default('') String firstName,
    @JsonKey(name: "last_name")
    @Default('') String lastName,
    @JsonKey(name: "refer_code")
    @Default('') String referCode,
    @JsonKey(name: "total_booking")
    @Default(0) int totalBooking,
    @JsonKey(name: "average_response")
    @Default(0) int averageResponse,
    @JsonKey(name: "status")
    @Default(0) int status,
    @JsonKey(name: "host_status")
    @Default('') String hostStatus,
    @JsonKey(name: "image")
    Image? image,
  }) = _Host;

  factory Host.fromJson(Map<String, dynamic> json) => _$HostFromJson(json);
}

@freezed
class Image extends ImageEntity with _$Image {
  const factory Image({
    @JsonKey(name: "id")
    @Default(0) int id,
    @JsonKey(name: "url")
    @Default('') String url,
    @JsonKey(name: "priority")
    @Default(0) int priority,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Location extends LocationEntity with _$Location {
  const factory Location({
    @JsonKey(name: "lat")
    @Default(0.0) double lat,
    @JsonKey(name: "lng")
    @Default(0.0) double lng,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
class PropertyType extends PropertyTypeEntity with _$PropertyType {
  const factory PropertyType({
    @JsonKey(name: "id")
    @Default(0) int id,
    @JsonKey(name: "name")
    @Default('') String name,
    @JsonKey(name: "description")
    @Default('') String description,
  }) = _PropertyType;

  factory PropertyType.fromJson(Map<String, dynamic> json) => _$PropertyTypeFromJson(json);
}

@freezed
class Rank extends RankEntity with _$Rank {
  const factory Rank({
    @JsonKey(name: "id")
    @Default(0) int id,
    @JsonKey(name: "name")
    @Default('') String name,
    @JsonKey(name: "description")
    @Default('') String description,
    @JsonKey(name: "type")
    @Default('') String type,
    @JsonKey(name: "point")
    @Default(0) int point,
    @JsonKey(name: "icon")
    @Default('') String icon,
    @JsonKey(name: "created_at")
    DateTime? createdAt,
    @JsonKey(name: "updated_at")
    DateTime? updatedAt,
    @JsonKey(name: "criterias")
    Criterias? criterias,
  }) = _Rank;

  factory Rank.fromJson(Map<String, dynamic> json) => _$RankFromJson(json);
}

@freezed
class Criterias extends CriteriasEntity with _$Criterias {
  const factory Criterias({
    @JsonKey(name: "rating")
    @Default('') String rating,
    @JsonKey(name: "review")
    @Default('') String review,
    @JsonKey(name: "isInstantBookingOn")
    @Default('') String isInstantBookingOn,
  }) = _Criterias;

  factory Criterias.fromJson(Map<String, dynamic> json) => _$CriteriasFromJson(json);
}

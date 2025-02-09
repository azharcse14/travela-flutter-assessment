import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:travela_assignment/features/explore/domain/entities/campaigns_entity.dart';

part 'campaigns_model.freezed.dart';
part 'campaigns_model.g.dart';

@freezed
class CampaignsModel extends CampaignsEntity with _$CampaignsModel {
  const factory CampaignsModel({
    @JsonKey(name: "success")
    @Default(false) bool success,
    @JsonKey(name: "message")
    @Default('') String message,
    @JsonKey(name: "data")
    @Default([]) List<CampaignsDataModel> data,
    @JsonKey(name: "meta")
    required dynamic meta,
  }) = _CampaignsModel;

  factory CampaignsModel.fromJson(Map<String, dynamic> json) => _$CampaignsModelFromJson(json);
}

@freezed
class CampaignsDataModel extends CampaignsDataEntity with _$CampaignsDataModel {
  const factory CampaignsDataModel({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "title")
    @Default('') String title,
    @JsonKey(name: "display_type")
    @Default('') String displayType,
    @JsonKey(name: "status")
    @Default('') String status,
    @JsonKey(name: "image")
    @Default('') String image,
    @JsonKey(name: "max_listing_by_host")
    @Default(0) int maxListingByHost,
    @JsonKey(name: "priority")
    @Default(0) int priority,
    @JsonKey(name: "description")
    @Default('') String description,
    @JsonKey(name: "youtube_link_text")
    @Default('') String youtubeLinkText,
    @JsonKey(name: "youtube_link_url")
    @Default('') String youtubeLinkUrl,
    @JsonKey(name: "start_date")
    DateTime? startDate,
    @JsonKey(name: "end_date")
    DateTime? endDate,
  }) = _CampaignsDataModel;

  factory CampaignsDataModel.fromJson(Map<String, dynamic> json) => _$CampaignsDataModelFromJson(json);
}

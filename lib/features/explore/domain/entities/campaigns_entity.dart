class CampaignsEntity {
  final bool success;
  final String message;
  final List<CampaignsDataEntity> data;
  final dynamic meta;

  CampaignsEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

}

class CampaignsDataEntity {
  final int id;
  final String title;
  final String displayType;
  final String status;
  final String image;
  final int maxListingByHost;
  final int priority;
  final String description;
  final String youtubeLinkText;
  final String youtubeLinkUrl;
  final DateTime? startDate;
  final DateTime? endDate;

  CampaignsDataEntity({
    required this.id,
    required this.title,
    required this.displayType,
    required this.status,
    required this.image,
    required this.maxListingByHost,
    required this.priority,
    required this.description,
    required this.youtubeLinkText,
    required this.youtubeLinkUrl,
    this.startDate,
    this.endDate,
  });

}

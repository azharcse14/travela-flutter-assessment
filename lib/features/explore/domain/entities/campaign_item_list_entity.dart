class CampaignItemListEntity {
  final bool success;
  final String message;
  final List<CampaignItemListDataEntity> data;
  final dynamic meta;

  CampaignItemListEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

}

class CampaignItemListDataEntity {
  final int id;
  final String title;
  final String placeType;
  final String address;
  final int maxGuest;
  final int maxChild;
  final int maxInfant;
  final int minNights;
  final int freeGuest;
  final int bedroom;
  final int beds;
  final int bathroom;
  final int price;
  final int weekendPrice;
  final int perGuestAmount;
  final String checkIn;
  final String checkOut;
  final String description;
  final int averageRating;
  final int averageResponse;
  final int totalAverage;
  final int commissionRate;
  final String commissionExpiredDate;
  final dynamic customMinCommission;
  final dynamic customCommission;
  final String instantBookingType;
  final String instantBookingFrom;
  final String instantBookingTo;
  final String instantBookingMessage;
  final int totalCount;
  final int showablePrice;
  final String type;
  final String advance;
  final int commission;
  final dynamic beforeDiscount;
  final dynamic averagePrice;
  final String status;
  final List<ImageEntity> images;
  final int reviewsCount;
  final int reviewsAvg;
  final dynamic hotel;
  final DateTime? createdAt;
  final LocationEntity? location;
  final PropertyTypeEntity? propertyType;
  final RankEntity? rank;
  final HostEntity? host;
  final CancellationEntity? cancellation;

  CampaignItemListDataEntity({
    required this.id,
    required this.title,
    required this.placeType,
    required this.address,
    required this.maxGuest,
    required this.maxChild,
    required this.maxInfant,
    required this.minNights,
    required this.freeGuest,
    required this.bedroom,
    required this.beds,
    required this.bathroom,
    required this.price,
    required this.weekendPrice,
    required this.perGuestAmount,
    required this.checkIn,
    required this.checkOut,
    required this.description,
    required this.averageRating,
    required this.averageResponse,
    required this.totalAverage,
    required this.commissionRate,
    required this.commissionExpiredDate,
    required this.customMinCommission,
    required this.customCommission,
    required this.instantBookingType,
    required this.instantBookingFrom,
    required this.instantBookingTo,
    required this.instantBookingMessage,
    required this.totalCount,
    required this.showablePrice,
    required this.type,
    required this.advance,
    required this.commission,
    required this.beforeDiscount,
    required this.averagePrice,
    required this.status,
    required this.images,
    required this.reviewsCount,
    required this.reviewsAvg,
    required this.hotel,
    this.createdAt,
    this.location,
    this.propertyType,
    this.rank,
    this.host,
    this.cancellation,
  });

}

class CancellationEntity {
  final String body;
  final String title;
  final String forHost;
  final int day;

  CancellationEntity({
    required this.body,
    required this.title,
    required this.forHost,
    required this.day,
  });

}

class HostEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String referCode;
  final int totalBooking;
  final int averageResponse;
  final int status;
  final String hostStatus;
  final ImageEntity? image;

  HostEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.referCode,
    required this.totalBooking,
    required this.averageResponse,
    required this.status,
    required this.hostStatus,
    this.image,
  });

}

class ImageEntity {
  final int id;
  final String url;
  final int priority;

  ImageEntity({
    required this.id,
    required this.url,
    required this.priority,
  });

}

class LocationEntity {
  final double lat;
  final double lng;

  LocationEntity({
    required this.lat,
    required this.lng,
  });

}

class PropertyTypeEntity {
  final int id;
  final String name;
  final String description;

  PropertyTypeEntity({
    required this.id,
    required this.name,
    required this.description,
  });

}

class RankEntity {
  final int id;
  final String name;
  final String description;
  final String type;
  final int point;
  final String icon;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CriteriasEntity? criterias;

  RankEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.point,
    required this.icon,
    this.createdAt,
    this.updatedAt,
    this.criterias,
  });

}

class CriteriasEntity {
  final String rating;
  final String review;
  final String isInstantBookingOn;

  CriteriasEntity({
    required this.rating,
    required this.review,
    required this.isInstantBookingOn,
  });

}

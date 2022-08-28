import 'package:flutter/foundation.dart';

@immutable
class GetCarouseListResponse {
  const GetCarouseListResponse({
    required this.carouse,
  });

  final List<Carouse> carouse;

  factory GetCarouseListResponse.fromJson(Map<String, dynamic> json) =>
      GetCarouseListResponse(
          carouse: (json['data'] as List? ?? [])
              .map((e) => Carouse.fromJson(e as Map<String, dynamic>))
              .toList());

  Map<String, dynamic> toJson() =>
      {'data': carouse.map((e) => e.toJson()).toList()};

  GetCarouseListResponse clone() =>
      GetCarouseListResponse(carouse: carouse.map((e) => e.clone()).toList());

  GetCarouseListResponse copyWith({List<Carouse>? carouse}) =>
      GetCarouseListResponse(
        carouse: carouse ?? this.carouse,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetCarouseListResponse && carouse == other.carouse;

  @override
  int get hashCode => carouse.hashCode;
}

@immutable
class Carouse {
  const Carouse({
    required this.sourceType,
    required this.topicName,
    required this.topicImage,
    required this.topicId,
    required this.link,
    required this.activityId,
  });

  final String sourceType;
  final String topicName;
  final String topicImage;
  final String topicId;
  final String link;
  final String activityId;

  factory Carouse.fromJson(Map<String, dynamic> json) => Carouse(
      sourceType: json['sourceType'].toString(),
      topicName: json['topicName'].toString(),
      topicImage: json['topicImage'].toString(),
      topicId: json['topicId'].toString(),
      link: json['link'].toString(),
      activityId: json['activityId'].toString());

  Map<String, dynamic> toJson() => {
        'sourceType': sourceType,
        'topicName': topicName,
        'topicImage': topicImage,
        'topicId': topicId,
        'link': link,
        'activityId': activityId
      };

  Carouse clone() => Carouse(
      sourceType: sourceType,
      topicName: topicName,
      topicImage: topicImage,
      topicId: topicId,
      link: link,
      activityId: activityId);

  Carouse copyWith(
          {String? sourceType,
          String? topicName,
          String? topicImage,
          String? topicId,
          String? link,
          String? activityId}) =>
      Carouse(
        sourceType: sourceType ?? this.sourceType,
        topicName: topicName ?? this.topicName,
        topicImage: topicImage ?? this.topicImage,
        topicId: topicId ?? this.topicId,
        link: link ?? this.link,
        activityId: activityId ?? this.activityId,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Carouse &&
          sourceType == other.sourceType &&
          topicName == other.topicName &&
          topicImage == other.topicImage &&
          topicId == other.topicId &&
          link == other.link &&
          activityId == other.activityId;

  @override
  int get hashCode =>
      sourceType.hashCode ^
      topicName.hashCode ^
      topicImage.hashCode ^
      topicId.hashCode ^
      link.hashCode ^
      activityId.hashCode;
}

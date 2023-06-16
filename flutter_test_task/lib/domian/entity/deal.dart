import 'package:json_annotation/json_annotation.dart';

part 'deal.g.dart';

@JsonSerializable()
class Deal {
  @JsonKey(name: 'OFFER_ID')
  final int offerId;

  @JsonKey(name: 'OFFER_FIRST_RESPONSIBLE')
  final String offerFristResponsible;

  @JsonKey(name: 'SEGMENT_NAME')
  final String segmentName;

  @JsonKey(name: 'STATUS_NAME')
  final String statusName;

  @JsonKey(name: 'OFFER_SUM')
  final String offerSum;

  Deal({
    required this.offerId,
    required this.offerFristResponsible,
    required this.segmentName,
    required this.statusName,
    required this.offerSum,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => _$DealFromJson(json);

  Map<String, dynamic> toJson() => _$DealToJson(this);

  Deal copyWith({
    int? offerId,
    String? offerFristResponsible,
    String? segmentName,
    String? statusName,
    String? offerSum,
  }) {
    return Deal(
      offerId: offerId ?? this.offerId,
      offerFristResponsible:
          offerFristResponsible ?? this.offerFristResponsible,
      segmentName: segmentName ?? this.segmentName,
      statusName: statusName ?? this.statusName,
      offerSum: offerSum ?? this.offerSum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offerId': offerId,
      'offerFristResponsible': offerFristResponsible,
      'segmentName': segmentName,
      'statusName': statusName,
      'offerSum': offerSum,
    };
  }

  factory Deal.fromMap(Map<String, dynamic> map) {
    return Deal(
      offerId: map['offerId'] as int,
      offerFristResponsible: map['offerFristResponsible'] as String,
      segmentName: map['segmentName'] as String,
      statusName: map['statusName'] as String,
      offerSum: map['offerSum'] as String,
    );
  }

  @override
  bool operator ==(covariant Deal other) {
    if (identical(this, other)) return true;

    return other.offerId == offerId &&
        other.offerFristResponsible == offerFristResponsible &&
        other.segmentName == segmentName &&
        other.statusName == statusName &&
        other.offerSum == offerSum;
  }

  @override
  int get hashCode {
    return offerId.hashCode ^
        offerFristResponsible.hashCode ^
        segmentName.hashCode ^
        statusName.hashCode ^
        offerSum.hashCode;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deal _$DealFromJson(Map<String, dynamic> json) => Deal(
      offerId: json['OFFER_ID'] as int,
      contactTitle: json['CONTACT_TITLE'] as String,
      statusName: json['STATUS_NAME'] as String,
      offerSum: json['OFFER_SUM'] as String,
    );

Map<String, dynamic> _$DealToJson(Deal instance) => <String, dynamic>{
      'OFFER_ID': instance.offerId,
      'CONTACT_TITLE': instance.contactTitle,
      'STATUS_NAME': instance.statusName,
      'OFFER_SUM': instance.offerSum,
    };

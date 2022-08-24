// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_term_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalTermResponse _$MedicalTermResponseFromJson(Map<String, dynamic> json) =>
    MedicalTermResponse(
      json['label'] as String,
      (json['contexts'] as List<dynamic>)
          .map((e) =>
              MedicalTermContextResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      MedicalTermClassificationResponse.fromJson(
          json['classification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedicalTermResponseToJson(
        MedicalTermResponse instance) =>
    <String, dynamic>{
      'label': instance.label,
      'contexts': instance.contexts,
      'classification': instance.classification,
    };

MedicalTermContextResponse _$MedicalTermContextResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalTermContextResponse(
      json['type'] as String,
      json['subtype'] as String,
    );

Map<String, dynamic> _$MedicalTermContextResponseToJson(
        MedicalTermContextResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'subtype': instance.subtype,
    };

MedicalTermClassificationResponse _$MedicalTermClassificationResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalTermClassificationResponse(
      json['main'] as String,
    );

Map<String, dynamic> _$MedicalTermClassificationResponseToJson(
        MedicalTermClassificationResponse instance) =>
    <String, dynamic>{
      'main': instance.main,
    };

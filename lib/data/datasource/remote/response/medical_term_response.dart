import 'package:json_annotation/json_annotation.dart';

part 'medical_term_response.g.dart';

@JsonSerializable()
class MedicalTermResponse {
  String label;
  List<MedicalTermContextResponse> contexts;
  MedicalTermClassificationResponse classification;

  MedicalTermResponse(this.label, this.contexts, this.classification);

  factory MedicalTermResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalTermResponseFromJson(json);

  static List<MedicalTermResponse> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => MedicalTermResponse.fromJson(json)).toList();
}

@JsonSerializable()
class MedicalTermContextResponse {
  String type;
  String subtype;

  MedicalTermContextResponse(this.type, this.subtype);

  factory MedicalTermContextResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalTermContextResponseFromJson(json);

  static List<MedicalTermContextResponse> fromJsonList(
          List<dynamic> jsonList) =>
      jsonList
          .map((json) => MedicalTermContextResponse.fromJson(json))
          .toList();
}

@JsonSerializable()
class MedicalTermClassificationResponse {
  String? main;

  MedicalTermClassificationResponse(this.main);

  factory MedicalTermClassificationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MedicalTermClassificationResponseFromJson(json);
}

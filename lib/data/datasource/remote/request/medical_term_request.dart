import 'package:json_annotation/json_annotation.dart';

part 'medical_term_request.g.dart';

@JsonSerializable()
class MedicalTermRequest {
  String text;

  MedicalTermRequest(this.text);

  Map<String, dynamic> toJson() => _$MedicalTermRequestToJson(this);
}

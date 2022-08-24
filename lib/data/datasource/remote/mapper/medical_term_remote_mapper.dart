import 'package:injectable/injectable.dart';
import 'package:my_health/app/resources/string/string_constants.dart';
import 'package:my_health/common/extension/list_extension.dart';
import 'package:my_health/common/mapper/base_data_mapper.dart';
import 'package:my_health/data/datasource/remote/response/medical_term_response.dart';
import 'package:my_health/domain/entity/medical_term_model.dart';

@singleton
class MedicalTermRemoteMapper
    extends BaseDataMapper<MedicalTermModel, MedicalTermResponse> {
  @override
  MedicalTermModel map(MedicalTermResponse response) {
    String unknown = StringConstants.kUnknown.toLowerCase();
    return MedicalTermModel(
      response.label,
      response.classification.main,
      response.contexts.firstOrNull?.type ?? unknown,
      response.contexts.firstOrNull?.subtype ?? unknown,
    );
  }
}

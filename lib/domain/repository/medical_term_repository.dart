import 'package:my_health/domain/entity/base/result.dart';
import 'package:my_health/domain/entity/medical_term_model.dart';

abstract class MedicalTermRepository {
  Future<Result<List<MedicalTermModel>>> extractMedicalTerms(String text);
}

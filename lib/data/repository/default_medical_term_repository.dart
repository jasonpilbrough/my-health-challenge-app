import 'package:injectable/injectable.dart';
import 'package:my_health/data/datasource/remote/medical_term_remote_datasource.dart';
import 'package:my_health/data/datasource/remote/request/medical_term_request.dart';
import 'package:my_health/domain/entity/base/result.dart';
import 'package:my_health/domain/entity/medical_term_model.dart';
import 'package:my_health/domain/repository/medical_term_repository.dart';

@Injectable(as: MedicalTermRepository)
class DefaultMedicalTermRepository implements MedicalTermRepository {
  final MedicalTermRemoteDatasource _remoteDatasource;

  DefaultMedicalTermRepository(this._remoteDatasource);

  @override
  Future<Result<List<MedicalTermModel>>> extractMedicalTerms(
      String text) async {
    MedicalTermRequest request = MedicalTermRequest(text);
    final result = await _remoteDatasource.extract(request);

    // If we wanted to cache the result locally, we could inject a local data
    // source and persist the data here.

    return result;
  }
}

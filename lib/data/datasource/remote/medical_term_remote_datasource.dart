import 'package:injectable/injectable.dart';
import 'package:my_health/data/datasource/remote/base_remote_datasource.dart';
import 'package:my_health/data/datasource/remote/client/http_client.dart';
import 'package:my_health/data/datasource/remote/mapper/medical_term_remote_mapper.dart';
import 'package:my_health/data/datasource/remote/request/medical_term_request.dart';
import 'package:my_health/data/datasource/remote/response/medical_term_response.dart';
import 'package:my_health/domain/entity/base/result.dart';
import 'package:my_health/domain/entity/medical_term_model.dart';

@singleton
class MedicalTermRemoteDatasource extends BaseRemoteDatasource {
  static const String _kExtractEntitiesPath = '/extract/entities';

  final MedicalTermRemoteMapper _mapper;

  MedicalTermRemoteDatasource(HttpClient httpClient, this._mapper)
      : super(httpClient);

  Future<Result<List<MedicalTermModel>>> extract(
      MedicalTermRequest request) async {
    Result<dynamic> response = await safePost(_kExtractEntitiesPath, request);
    return response.map(
      success: (result) => Result.success(_mapModel(result.data)),
      exception: (result) => Result.exception(result.cause, result.stackTrace),
    );
  }

  List<MedicalTermModel> _mapModel(dynamic data) {
    final list = MedicalTermResponse.fromJsonList(data);
    return _mapper.mapList(list);
  }
}

import 'package:http_interceptor/http_interceptor.dart';
import 'package:my_health/common/configuration/configuration.dart';

class AuthenticationInterceptor implements InterceptorContract {
  static const String _kJsonContentType = 'application/json';

  final Configuration _configuration;

  AuthenticationInterceptor(this._configuration);

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers.addAll({
      'Authorization': 'Bearer ${_configuration.apiKey}',
      'Content-Type': _kJsonContentType
    });
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/common/configuration/configuration.dart';
import 'package:my_health/data/datasource/remote/interceptor/interceptors_factory.dart';

@singleton
class HttpClient {
  final http.Client _client;
  final Configuration _configuration;

  HttpClient(this._configuration, InterceptorsFactory factory)
      : _client = InterceptedClient.build(interceptors: factory.make());

  dynamic get(String path, Map<String, String> queryParams) async {
    Uri uri = _constructUri(path).replace(queryParameters: queryParams);
    return _withTimeout(() async => _client.get(uri));
  }

  dynamic post(String path, dynamic requestBody) async {
    Uri uri = _constructUri(path);
    return _withTimeout(() async => _client.post(uri, body: requestBody));
  }

  dynamic _withTimeout(Future<http.Response?> Function() httpCall) =>
      httpCall().timeout(Duration(seconds: _configuration.networkTimeout));

  Uri _constructUri(String path) => Uri.parse('${_configuration.baseUrl}$path');
}

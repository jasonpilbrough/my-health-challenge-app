import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/common/configuration/configuration.dart';
import 'package:my_health/data/datasource/remote/interceptor/authentication_interceptor.dart';
import 'package:my_health/data/datasource/remote/interceptor/logging_interceptor.dart';

@injectable
class InterceptorsFactory {
  final Configuration _configuration;

  InterceptorsFactory(this._configuration);

  List<InterceptorContract> make() {
    return [
      AuthenticationInterceptor(_configuration),
      LoggingInterceptor(),
    ];
  }
}

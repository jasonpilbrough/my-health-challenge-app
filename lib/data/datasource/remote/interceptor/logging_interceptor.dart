import 'package:http_interceptor/http_interceptor.dart';
import 'package:my_health/common/exception/app_logger.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    Logger.log("(Request): { ${data.toString()} }");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    Logger.log("(Response): { ${data.toString()} }");
    return data;
  }
}

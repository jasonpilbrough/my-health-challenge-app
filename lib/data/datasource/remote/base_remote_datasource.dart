import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_health/common/exception/cause.dart';
import 'package:my_health/common/exception/result_stack_trace.dart';
import 'package:my_health/data/datasource/remote/client/http_client.dart';
import 'package:my_health/data/datasource/remote/constants/http_status_codes.dart';
import 'package:my_health/data/datasource/remote/response/base/api_response.dart';
import 'package:my_health/domain/entity/base/no_data.dart';
import 'package:my_health/domain/entity/base/result.dart';

abstract class BaseRemoteDatasource {
  final HttpClient _httpClient;

  BaseRemoteDatasource(this._httpClient);

  Future<Result<dynamic>> safeGet(String path,
      {Map<String, String> queryParams = const {}}) async {
    return await _safeApiCall(() {
      return _httpClient.get(path, queryParams);
    });
  }

  Future<Result<dynamic>> safePost(String path, dynamic requestBody) async {
    return await _safeApiCall(() {
      final requestJson = json.encode(requestBody);
      return _httpClient.post(path, requestJson);
    });
  }

  Future<Result<dynamic>> _safeApiCall(dynamic Function() apiCall) async {
    try {
      dynamic response = await apiCall();
      Result<dynamic> result = _process(response);
      return result;
    } on TimeoutException catch (_, stackTrace) {
      return Result.exception(
        Cause.connectionTimeout(),
        ResultStackTrace(stackTrace),
      );
    } on SocketException catch (_, stackTrace) {
      return Result.exception(
        Cause.connectionTimeout(),
        ResultStackTrace(stackTrace),
      );
    } on FormatException catch (exception, stackTrace) {
      return Result.exception(
        Cause.malformedResponse(exception.toString()),
        ResultStackTrace(stackTrace),
      );
    } catch (exception, stackTrace) {
      return Result.exception(
        Cause.generic(exception.toString()),
        ResultStackTrace(stackTrace),
      );
    }
  }

  Result<dynamic> _process(http.Response? response) {
    if (response == null) {
      return Result.exception(
        Cause.malformedResponse("Response can not be null"),
        ResultStackTrace(StackTrace.current),
      );
    }
    switch (response.statusCode) {
      case k200Ok:
      case k201Created:
        final responseJson = json.decode(response.body);
        final apiResponse = ApiResponse.fromJson(responseJson);
        return _validate(apiResponse);
      case k204NoContent:
        return Result.success(NoData());
      case k400BadRequest:
        String? request = response.request?.toString();
        return Result.exception(
          Cause.malformedRequest(request),
          ResultStackTrace(StackTrace.current),
        );
      case k401Unauthorized:
      case k403Forbidden:
        return Result.exception(
          Cause.notAuthorised(),
          ResultStackTrace(StackTrace.current),
        );
      case k404NotFound:
        String? requestUrl = response.request?.url.toString();
        return Result.exception(
          Cause.notFound(requestUrl),
          ResultStackTrace(StackTrace.current),
        );
      case k500InternalServerError:
        return Result.exception(
          Cause.serverFailure(),
          ResultStackTrace(StackTrace.current),
        );
      default:
        return Result.exception(
          Cause.generic(
            'Unexpected http status code \'${response.statusCode}\'',
          ),
          ResultStackTrace(StackTrace.current),
        );
    }
  }

  Result<dynamic> _validate(ApiResponse apiResponse) {
    return Result.success(apiResponse.data);
  }
}

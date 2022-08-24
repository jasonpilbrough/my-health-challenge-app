import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_health/common/exception/cause.dart';
import 'package:my_health/common/exception/result_stack_trace.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;

  const factory Result.exception(Cause cause, ResultStackTrace stackTrace) =
      Exception<T>;
}

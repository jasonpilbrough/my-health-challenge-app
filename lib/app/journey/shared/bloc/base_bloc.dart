import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_health/common/exception/app_logger.dart';
import 'package:my_health/common/exception/crash_reporting.dart';
import 'package:my_health/domain/entity/base/result.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  final CrashReporting _crashReporting;

  BaseBloc(State initialState, this._crashReporting) : super(initialState);

  Future<void> safeOperation(Function operation, Function onError) async {
    try {
      await operation();
    } catch (error, stackTrace) {
      onError();
      _crashReporting.reportNonFatal(error, stackTrace: stackTrace);
    }
  }

  void emitResult(Emitter<State> emit, State state, Result result) {
    Logger.result(result.toString());
    emit(state);

    if (result is Exception) {
      _crashReporting.reportNonFatal(result.toString(),
          stackTrace: result.stackTrace.data);
    }
  }
}

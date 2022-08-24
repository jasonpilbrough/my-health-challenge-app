import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/app/journey/extract/bloc/extract_event.dart';
import 'package:my_health/app/journey/extract/bloc/extract_state.dart';
import 'package:my_health/app/journey/shared/bloc/base_bloc.dart';
import 'package:my_health/app/resources/string/string_constants.dart';
import 'package:my_health/common/exception/crash_reporting.dart';
import 'package:my_health/domain/service/text_extraction_service.dart';

@Injectable()
class ExtractBloc extends BaseBloc<ExtractEvent, ExtractState> {
  static final ExtractState _initialState = ExtractLoadingState();
  static final ExtractState _defaultErrorState =
      ExtractErrorState(StringConstants.kGenericError);

  final TextExtractionService _textExtractionService;

  ExtractBloc(
    this._textExtractionService,
    CrashReporting crashReporting,
  ) : super(_initialState, crashReporting) {
    on<ExtractTextEvent>(
      (event, emit) async {
        await safeOperation(
          () => _onExtractText(event, emit),
          () => emit(_defaultErrorState),
        );
      },
    );
  }

  Future<void> _onExtractText(
    ExtractTextEvent event,
    Emitter<ExtractState> emit,
  ) async {
    emit(ExtractLoadingState());

    String extractedText =
        await _textExtractionService.extractFromImage(event.image);

    final successState = ExtractLoadedState(extractedText: extractedText);
    emit(successState);
  }
}

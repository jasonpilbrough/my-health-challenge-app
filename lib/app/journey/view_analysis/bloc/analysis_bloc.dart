import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/app/journey/shared/bloc/base_bloc.dart';
import 'package:my_health/app/journey/view_analysis/bloc/analysis_event.dart';
import 'package:my_health/app/journey/view_analysis/bloc/analysis_state.dart';
import 'package:my_health/app/resources/string/string_constants.dart';
import 'package:my_health/common/exception/crash_reporting.dart';
import 'package:my_health/domain/entity/base/result.dart';
import 'package:my_health/domain/entity/medical_term_model.dart';
import 'package:my_health/domain/repository/medical_term_repository.dart';

@Injectable()
class AnalysisBloc extends BaseBloc<AnalysisEvent, AnalysisState> {
  static final AnalysisState _initialState = AnalysisLoadingState();
  static final AnalysisState _defaultErrorState =
      AnalysisErrorState(StringConstants.kFailedToLoad);

  final MedicalTermRepository _repository;

  AnalysisBloc(this._repository, CrashReporting crashReporting)
      : super(_initialState, crashReporting) {
    on<ExtractMedicalTermsEvent>(
      (event, emit) async {
        await safeOperation(
          () => _onExtractMedicalTerms(event, emit),
          () => emit(_defaultErrorState),
        );
      },
    );
  }

  Future<void> _onExtractMedicalTerms(
    ExtractMedicalTermsEvent event,
    Emitter<AnalysisState> emit,
  ) async {
    emit(AnalysisLoadingState());

    Result<List<MedicalTermModel>> result =
        await _repository.extractMedicalTerms(event.text);

    if (result is Exception) {
      emitResult(emit, _defaultErrorState, result);
      return;
    }

    List<MedicalTermModel> data = (result as Success).data;
    final successState = AnalysisLoadedState(medicalTerms: data);

    emitResult(emit, successState, result);
  }
}

import 'package:my_health/domain/entity/medical_term_model.dart';

abstract class AnalysisState {
  final bool isLoading;
  final String? errorMessage;
  final List<MedicalTermModel>? medicalTerms;

  AnalysisState({
    this.errorMessage,
    this.medicalTerms,
    this.isLoading = false,
  });
}

class AnalysisLoadingState extends AnalysisState {
  AnalysisLoadingState() : super(isLoading: true);
}

class AnalysisLoadedState extends AnalysisState {
  AnalysisLoadedState({required List<MedicalTermModel> medicalTerms})
      : super(medicalTerms: medicalTerms);

  @override
  List<MedicalTermModel> get medicalTerms {
    return super.medicalTerms!;
  }
}

class AnalysisErrorState extends AnalysisState {
  AnalysisErrorState(String errorMessage) : super(errorMessage: errorMessage);
}

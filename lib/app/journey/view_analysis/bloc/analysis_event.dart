abstract class AnalysisEvent {}

class ExtractMedicalTermsEvent extends AnalysisEvent {
  final String text;

  ExtractMedicalTermsEvent(this.text);
}

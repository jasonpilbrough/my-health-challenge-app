class MedicalTermModel {
  String label;
  String classification;
  String contextType;
  String contextSubtype;

  MedicalTermModel(
    this.label,
    this.classification,
    this.contextType,
    this.contextSubtype,
  );

  @override
  String toString() {
    return 'MedicalTermModel{label: $label, classification: $classification, '
        'contextType: $contextType, contextSubtype: $contextSubtype}';
  }
}

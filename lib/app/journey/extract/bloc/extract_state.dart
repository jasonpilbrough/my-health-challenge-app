abstract class ExtractState {
  final bool isLoading;
  final String? errorMessage;
  final String? extractedText;

  ExtractState({
    this.errorMessage,
    this.extractedText,
    this.isLoading = false,
  });
}

class ExtractLoadingState extends ExtractState {
  ExtractLoadingState() : super(isLoading: true);
}

class ExtractLoadedState extends ExtractState {
  ExtractLoadedState({required String extractedText})
      : super(extractedText: extractedText);

  @override
  String get extractedText {
    return super.extractedText!;
  }
}

class ExtractErrorState extends ExtractState {
  ExtractErrorState(String errorMessage) : super(errorMessage: errorMessage);
}

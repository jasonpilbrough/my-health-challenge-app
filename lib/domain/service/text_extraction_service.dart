import 'dart:io';

abstract class TextExtractionService {
  Future<String> extractFromImage(File image);
}

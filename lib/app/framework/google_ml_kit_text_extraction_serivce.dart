import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/domain/service/text_extraction_service.dart';

@Injectable(as: TextExtractionService)
class GoogleMLKitTextExtractionService implements TextExtractionService {
  @override
  Future<String> extractFromImage(File image) async {
    // This computation should probably be done off the main thread
    InputImage inputImage = InputImage.fromFile(image);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final recognizedText = await textRecognizer.processImage(inputImage);
    final cleanedText = _postProcess(recognizedText.text);
    return cleanedText;
  }

  String _postProcess(String rawText) {
    return rawText.trim().replaceAll('\n', " ");
  }
}

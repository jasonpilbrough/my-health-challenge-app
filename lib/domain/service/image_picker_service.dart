import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:my_health/domain/entity/base/result.dart';

abstract class ImagePickerService {
  Future<Result<File>> pick(ImageSource source);
}

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/common/exception/cause.dart';
import 'package:my_health/common/exception/crash_reporting.dart';
import 'package:my_health/common/exception/result_stack_trace.dart';
import 'package:my_health/domain/entity/base/result.dart';
import 'package:my_health/domain/service/image_picker_service.dart';

@Injectable(as: ImagePickerService)
class DeviceImagePickerService implements ImagePickerService {
  final CrashReporting _crashReporting;

  DeviceImagePickerService(this._crashReporting);

  @override
  Future<Result<File>> pick(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        throw FileSystemException('Failed to retrieve image from device using '
            'source \'${source.name}\'');
      }
      final imageTemp = File(image.path);
      return Result.success(imageTemp);
    } catch (exception, stackTrace) {
      _crashReporting.reportNonFatal(exception);
      return Result.exception(
        Cause.generic(exception.toString()),
        ResultStackTrace(stackTrace),
      );
    }
  }
}

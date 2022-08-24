import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_health/app/di/app_module.dart';
import 'package:my_health/app/journey/capture/widget/image_preview_widget.dart';
import 'package:my_health/app/journey/capture/widget/selectable_list_tile_widget.dart';
import 'package:my_health/app/journey/extract/page/extract_screen.dart';
import 'package:my_health/app/journey/shared/widget/app_scaffold.dart';
import 'package:my_health/app/resources/dimen/dimen_constants.dart';
import 'package:my_health/app/resources/string/string_constants.dart';
import 'package:my_health/domain/entity/base/result.dart';
import 'package:my_health/domain/service/image_picker_service.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({Key? key}) : super(key: key);

  static Route getRoute() {
    return MaterialPageRoute(builder: (context) => const CaptureScreen());
  }

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  late ImagePickerService _imagePicker;
  File? selectedImage;

  Future pickImage(ImageSource source) async {
    Result<File> result = await _imagePicker.pick(source);
    if (result is Success) {
      setState(() => selectedImage = (result as Success).data);
    } else {
      // ignore for now
    }
  }

  void _proceedToNextScreen(BuildContext context, File image) async {
    Navigator.push(context, ExtractScreen.getRoute(image));
  }

  @override
  void initState() {
    super.initState();
    _imagePicker = locator<ImagePickerService>();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBarTitle: StringConstants.kHealth,
        persistentFooterButtons: _footerButtons(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.kImageUploadMethod,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: DimenConstants.kSpacer16,
            ),
            SelectableListTile(
              label: StringConstants.kSelectFromGallery,
              icon: Icons.image,
              onTap: () => pickImage(ImageSource.gallery),
            ),
            SelectableListTile(
              label: StringConstants.kScanWithCamera,
              icon: Icons.camera_alt,
              onTap: () => pickImage(ImageSource.camera),
            ),
            const SizedBox(
              height: DimenConstants.kSpacer16,
            ),
            ImagePreview(image: selectedImage),
          ],
        ));
  }

  List<Widget>? _footerButtons() {
    if (selectedImage == null) {
      return null;
    }
    return [
      ElevatedButton(
        child: const Text(StringConstants.kContinue),
        onPressed: () => _proceedToNextScreen(context, selectedImage!),
      ),
    ];
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_health/app/journey/capture/widget/image_frame_widget.dart';
import 'package:my_health/app/journey/capture/widget/place_holder_image_widget.dart';
import 'package:my_health/app/resources/dimen/dimen_constants.dart';
import 'package:my_health/app/resources/string/string_constants.dart';

class ImagePreview extends StatelessWidget {
  final File? image;

  const ImagePreview({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.kPreview,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: DimenConstants.kSpacer16),
        _imageView(),
      ],
    );
  }

  Widget _imageView() {
    if (image == null) {
      return const ImageFrame(child: PlaceHolderImage());
    }
    return ImageFrame(child: Image.file(image!));
  }
}

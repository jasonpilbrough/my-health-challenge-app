import 'package:flutter/material.dart';
import 'package:my_health/app/resources/string/string_constants.dart';

class PlaceHolderImage extends StatelessWidget {
  static const double _kPlaceHolderImageHeight = 200.0;

  const PlaceHolderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _kPlaceHolderImageHeight,
      child: Center(
        child: Text(
          StringConstants.kUploadToSeePreview,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
        ),
      ),
    );
  }
}

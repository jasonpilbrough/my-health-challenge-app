import 'package:flutter/material.dart';
import 'package:my_health/app/resources/dimen/dimen_constants.dart';
import 'package:my_health/app/resources/theme/theme_colours.dart';

class ImageFrame extends StatelessWidget {
  final Widget child;
  const ImageFrame({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DimenConstants.kBorderRadius),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.kDividerColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(DimenConstants.kBorderRadius),
        ),
      ),
      child: child,
    );
  }
}

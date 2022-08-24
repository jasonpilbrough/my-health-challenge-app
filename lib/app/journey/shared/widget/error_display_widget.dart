import 'package:flutter/material.dart';
import 'package:my_health/app/resources/dimen/dimen_constants.dart';
import 'package:my_health/app/resources/string/string_constants.dart';
import 'package:my_health/app/resources/theme/theme_colours.dart';

class ErrorDisplay extends StatelessWidget {
  final String errorMessage;

  const ErrorDisplay(String? message, {Key? key})
      : errorMessage = message ?? StringConstants.kGenericError,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.notifications_rounded,
            size: DimenConstants.kIconLarge,
            color: ThemeColors.kInactiveColor,
          ),
          const SizedBox(height: DimenConstants.kSpacer32),
          Text(
            StringConstants.kOhNo,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: DimenConstants.kSpacer16),
          Text(
            errorMessage,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: DimenConstants.kSpacer16),
        ],
      ),
    );
  }
}

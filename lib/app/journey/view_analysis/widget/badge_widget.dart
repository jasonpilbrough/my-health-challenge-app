import 'package:flutter/material.dart';
import 'package:my_health/app/resources/dimen/dimen_constants.dart';

class Badge extends StatelessWidget {
  final String label;
  final Color color;

  const Badge({Key? key, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(DimenConstants.kBorderRadius),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: DimenConstants.kSpacer2,
            horizontal: DimenConstants.kSpacer2,
          ),
          child: Text(
            label,
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_health/app/resources/dimen/dimen_constants.dart';
import 'package:my_health/app/resources/theme/theme_colours.dart';

class SelectableListTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onTap;

  const SelectableListTile({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            label,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          leading: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: DimenConstants.kIconSmall,
          ),
          dense: true,
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
            horizontal: VisualDensity.minimumDensity,
          ),
          onTap: onTap,
        ),
        const Divider(color: ThemeColors.kDividerColor)
      ],
    );
  }
}

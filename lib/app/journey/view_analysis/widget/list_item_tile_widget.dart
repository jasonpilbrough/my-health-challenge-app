import 'package:flutter/material.dart';
import 'package:my_health/app/journey/view_analysis/widget/badge_widget.dart';
import 'package:my_health/app/resources/string/string_constants.dart';
import 'package:my_health/app/resources/theme/theme_colours.dart';
import 'package:my_health/domain/entity/medical_term_model.dart';

class ListItemTile extends StatelessWidget {
  final MedicalTermModel model;

  const ListItemTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(model.label),
      trailing: Badge(
        label: model.classification,
        color: ThemeColors.kInactiveColor,
      ),
      subtitle: Text(
        '${StringConstants.kContext}: ${model.contextType}, ${model.contextSubtype}',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_health/app/journey/shared/widget/app_bar_text_widget.dart';
import 'package:my_health/app/resources/dimen/dimen_constants.dart';

class AppScaffold extends StatelessWidget {
  final String appBarTitle;
  final List<Widget>? persistentFooterButtons;
  final Widget child;

  const AppScaffold({
    Key? key,
    required this.appBarTitle,
    required this.child,
    this.persistentFooterButtons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: appBarTitle),
      ),
      persistentFooterButtons: persistentFooterButtons,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(DimenConstants.kGutterSpace),
          child: child,
        ),
      ),
    );
  }
}

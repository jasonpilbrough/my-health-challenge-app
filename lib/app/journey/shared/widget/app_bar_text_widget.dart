import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String text;

  const AppBarText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.headline4?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        );
    return Text(text, style: style);
  }
}

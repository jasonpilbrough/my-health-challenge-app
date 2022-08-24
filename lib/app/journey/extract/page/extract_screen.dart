import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_health/app/di/app_module.dart';
import 'package:my_health/app/journey/extract/bloc/extract_bloc.dart';
import 'package:my_health/app/journey/extract/bloc/extract_event.dart';
import 'package:my_health/app/journey/extract/bloc/extract_state.dart';
import 'package:my_health/app/journey/shared/widget/app_scaffold.dart';
import 'package:my_health/app/journey/shared/widget/error_display_widget.dart';
import 'package:my_health/app/journey/shared/widget/loading_indicator_widget.dart';
import 'package:my_health/app/journey/view_analysis/page/analysis_screen.dart';
import 'package:my_health/app/resources/dimen/dimen_constants.dart';
import 'package:my_health/app/resources/string/string_constants.dart';

class ExtractScreen extends StatefulWidget {
  final File image;

  const ExtractScreen({Key? key, required this.image}) : super(key: key);

  static Route getRoute(File image) {
    return MaterialPageRoute(builder: (context) => ExtractScreen(image: image));
  }

  @override
  State<ExtractScreen> createState() => _ExtractScreenState();
}

class _ExtractScreenState extends State<ExtractScreen> {
  late ExtractBloc _extractBloc;
  String? editedExtractedText;

  @override
  void initState() {
    super.initState();
    _extractBloc = locator<ExtractBloc>()..add(ExtractTextEvent(widget.image));
  }

  void _proceedToNextScreen(BuildContext context) async {
    if (editedExtractedText != null) {
      Navigator.push(
          context, ViewAnalysisScreen.getRoute(editedExtractedText!));
    }
  }

  void _onTextChanged(String newText) {
    editedExtractedText = newText;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: StringConstants.kReview,
      persistentFooterButtons: [
        ElevatedButton(
          child: const Text(StringConstants.kSubmit),
          onPressed: () => _proceedToNextScreen(context),
        ),
      ],
      child: BlocProvider(
        create: (context) => _extractBloc,
        child: BlocBuilder<ExtractBloc, ExtractState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case ExtractLoadingState:
                return const LoadingIndicator();
              case ExtractLoadedState:
                final loadedState = state as ExtractLoadedState;
                _onTextChanged(loadedState.extractedText);
                return _renderLoadedState(loadedState.extractedText);
              case ExtractErrorState:
                return ErrorDisplay((state as ExtractErrorState).errorMessage);
              default:
                return const ErrorDisplay(null);
            }
          },
        ),
      ),
    );
  }

  Widget _renderLoadedState(String extractedText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.kDoctorNoteText,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: DimenConstants.kSpacer16,
        ),
        Text(
          StringConstants.kDoctorNoteEdit,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
        ),
        const SizedBox(height: DimenConstants.kSpacer32),
        TextFormField(
          decoration: const InputDecoration(
            labelText: StringConstants.kDoctorsNote,
            border: OutlineInputBorder(),
          ),
          initialValue: extractedText,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (newText) => _onTextChanged(newText),
        ),
      ],
    );
  }
}

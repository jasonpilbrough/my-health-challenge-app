import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_health/app/di/app_module.dart';
import 'package:my_health/app/journey/capture/page/capture_screen.dart';
import 'package:my_health/app/journey/shared/widget/app_scaffold.dart';
import 'package:my_health/app/journey/shared/widget/error_display_widget.dart';
import 'package:my_health/app/journey/shared/widget/loading_indicator_widget.dart';
import 'package:my_health/app/journey/view_analysis/bloc/analysis_bloc.dart';
import 'package:my_health/app/journey/view_analysis/bloc/analysis_event.dart';
import 'package:my_health/app/journey/view_analysis/bloc/analysis_state.dart';
import 'package:my_health/app/journey/view_analysis/widget/list_item_tile_widget.dart';
import 'package:my_health/app/resources/string/string_constants.dart';
import 'package:my_health/app/resources/theme/theme_colours.dart';
import 'package:my_health/domain/entity/medical_term_model.dart';

class ViewAnalysisScreen extends StatefulWidget {
  final String extractedText;

  const ViewAnalysisScreen({Key? key, required this.extractedText})
      : super(key: key);

  static Route getRoute(String extractedText) {
    return MaterialPageRoute(
      builder: (context) => ViewAnalysisScreen(extractedText: extractedText),
    );
  }

  @override
  State<ViewAnalysisScreen> createState() => _ViewAnalysisScreenState();
}

class _ViewAnalysisScreenState extends State<ViewAnalysisScreen> {
  late AnalysisBloc _analysisBloc;

  @override
  void initState() {
    super.initState();
    _analysisBloc = locator<AnalysisBloc>()
      ..add(ExtractMedicalTermsEvent(widget.extractedText));
  }

  void _backToHomeScreen(BuildContext context) async {
    Navigator.of(context)
        .pushAndRemoveUntil(CaptureScreen.getRoute(), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: StringConstants.kAnalysis,
      persistentFooterButtons: [
        ElevatedButton(
          child: const Text(StringConstants.kDone),
          onPressed: () => _backToHomeScreen(context),
        ),
      ],
      child: BlocProvider(
        create: (context) => _analysisBloc,
        child:
            BlocBuilder<AnalysisBloc, AnalysisState>(builder: (context, state) {
          switch (state.runtimeType) {
            case AnalysisLoadingState:
              return const LoadingIndicator();
            case AnalysisLoadedState:
              return _renderLoadedState(
                  (state as AnalysisLoadedState).medicalTerms);
            case AnalysisErrorState:
              return ErrorDisplay((state as AnalysisErrorState).errorMessage);
            default:
              return const ErrorDisplay(null);
          }
        }),
      ),
    );
  }

  Widget _renderLoadedState(List<MedicalTermModel> data) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListItemTile(model: data[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: ThemeColors.kDividerColor,
        );
      },
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../common/configuration/configuration.dart' as _i8;
import '../../common/exception/crash_reporting.dart' as _i3;
import '../../data/datasource/remote/client/http_client.dart' as _i13;
import '../../data/datasource/remote/interceptor/interceptors_factory.dart'
    as _i7;
import '../../data/datasource/remote/mapper/medical_term_remote_mapper.dart'
    as _i9;
import '../../data/datasource/remote/medical_term_remote_datasource.dart'
    as _i14;
import '../../data/repository/default_medical_term_repository.dart' as _i16;
import '../../domain/repository/medical_term_repository.dart' as _i15;
import '../../domain/service/image_picker_service.dart' as _i5;
import '../../domain/service/text_extraction_service.dart' as _i10;
import '../exception/global_exception_handler.dart' as _i4;
import '../framework/device_image_picker_service.dart' as _i6;
import '../framework/google_ml_kit_text_extraction_serivce.dart' as _i11;
import '../journey/extract/bloc/extract_bloc.dart' as _i12;
import '../journey/view_analysis/bloc/analysis_bloc.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.CrashReporting>(_i3.CrashReporting());
  gh.singleton<_i4.GlobalExceptionHandler>(
      _i4.GlobalExceptionHandler(get<_i3.CrashReporting>()));
  gh.factory<_i5.ImagePickerService>(
      () => _i6.DeviceImagePickerService(get<_i3.CrashReporting>()));
  gh.factory<_i7.InterceptorsFactory>(
      () => _i7.InterceptorsFactory(get<_i8.Configuration>()));
  gh.singleton<_i9.MedicalTermRemoteMapper>(_i9.MedicalTermRemoteMapper());
  gh.factory<_i10.TextExtractionService>(
      () => _i11.GoogleMLKitTextExtractionService());
  gh.factory<_i12.ExtractBloc>(() => _i12.ExtractBloc(
      get<_i10.TextExtractionService>(), get<_i3.CrashReporting>()));
  gh.singleton<_i13.HttpClient>(_i13.HttpClient(
      get<_i8.Configuration>(), get<_i7.InterceptorsFactory>()));
  gh.singleton<_i14.MedicalTermRemoteDatasource>(
      _i14.MedicalTermRemoteDatasource(
          get<_i13.HttpClient>(), get<_i9.MedicalTermRemoteMapper>()));
  gh.factory<_i15.MedicalTermRepository>(() =>
      _i16.DefaultMedicalTermRepository(
          get<_i14.MedicalTermRemoteDatasource>()));
  gh.factory<_i17.AnalysisBloc>(() => _i17.AnalysisBloc(
      get<_i15.MedicalTermRepository>(), get<_i3.CrashReporting>()));
  return get;
}

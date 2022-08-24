import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/app/di/app_module.config.dart';
import 'package:my_health/common/configuration/configuration.dart';

final _locator = GetIt.instance;

@InjectableInit(
    initializerName: r'$initGetIt',
    preferRelativeImports: true,
    asExtension: false,
    generateForDir: ['lib'])
void registerDependencies(Configuration configuration) {
  _registerCustomDependencies(configuration);
  $initGetIt(_locator);
}

GetIt get locator => _locator;

void _registerCustomDependencies(Configuration config) {
  GetItHelper(_locator, null, null).singleton<Configuration>(config);
}

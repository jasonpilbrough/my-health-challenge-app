import 'package:global_configuration/global_configuration.dart';
import 'package:my_health/common/configuration/configuration.dart';
import 'package:my_health/common/exception/app_logger.dart';

class ConfigLoader {
  static const String _appSettingsLocation = "assets/config/appsettings.json";
  static const String _secretsLocation = "assets/config/secrets.json";

  static Future<Configuration> load() async {
    await GlobalConfiguration().loadFromPath(_appSettingsLocation);
    await GlobalConfiguration().loadFromPath(_secretsLocation);

    Logger.i("Fetching local configuration...");
    return Configuration(
      apiKey: _getValue<String>(Configuration.apiKeyKey),
      baseUrl: _getValue<String>(Configuration.baseUrlKey),
      networkTimeout: _getValue<int>(Configuration.networkTimeoutKey),
    );
  }

  static T _getValue<T>(String key) {
    try {
      return GlobalConfiguration().getValue(key) as T;
    } catch (_) {
      throw Exception("Failed to find configuration for key '$key' and "
          "type '${T.toString()}'.");
    }
  }
}

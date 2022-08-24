// Manually registered in DI container
class Configuration {
  static const String baseUrlKey = 'baseUrl';
  static const String networkTimeoutKey = 'networkTimeoutInSeconds';
  static const String apiKeyKey = 'apiKey';

  final String baseUrl;
  final int networkTimeout;
  final String apiKey;

  Configuration({
    required this.baseUrl,
    required this.networkTimeout,
    required this.apiKey,
  });
}

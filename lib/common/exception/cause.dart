class Cause {
  final String logMessage;

  Cause._(String prefix, String? logMessage)
      : logMessage = buildLogMessage(prefix, logMessage);

  factory Cause.connectionTimeout() = ConnectionTimeout;

  factory Cause.malformedRequest(String? logMessage) = MalformedRequest;

  factory Cause.malformedResponse(String? logMessage) = MalformedResponse;

  factory Cause.notFound(String? logMessage) = NotFound;

  factory Cause.notAuthorised() = NotAuthorised;

  factory Cause.serverFailure() = ServerFailure;

  factory Cause.generic(String logMessage) = General;

  static String buildLogMessage(String prefix, String? logMessage) {
    String description = logMessage != null ? ": $logMessage" : "";
    return "$prefix $description";
  }

  @override
  String toString() => logMessage;
}

class ConnectionTimeout extends Cause {
  ConnectionTimeout() : super._("Connection timeout", null);
}

class MalformedRequest extends Cause {
  MalformedRequest(String? logMessage)
      : super._("Malformed request", logMessage);
}

class MalformedResponse extends Cause {
  MalformedResponse(String? logMessage)
      : super._("Malformed response", logMessage);
}

class NotFound extends Cause {
  NotFound(String? logMessage) : super._("Resource not found", logMessage);
}

class NotAuthorised extends Cause {
  NotAuthorised() : super._("Not authorised", null);
}

class ServerFailure extends Cause {
  ServerFailure() : super._("Server failure", null);
}

class General extends Cause {
  General(String logMessage) : super._("Generic exception", logMessage);
}

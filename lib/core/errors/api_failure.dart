/// Single failure type for API errors (RFC 9457 `problem+json`).
///
/// Never stores or logs tokens or personal data: only the problem fields
/// returned by the server are kept.
sealed class ApiFailure implements Exception {
  const ApiFailure({this.title, this.detail, this.statusCode, this.type});

  /// Builds a failure from a `problem+json` body.
  factory ApiFailure.fromProblemJson(
    Map<String, dynamic> json, {
    int? statusCode,
  }) {
    final rawStatus = json['status'];
    final status = rawStatus is int ? rawStatus : statusCode;
    final rawTitle = json['title'];
    final title = rawTitle is String ? rawTitle : null;
    final rawDetail = json['detail'];
    final detail = rawDetail is String ? rawDetail : null;
    final rawType = json['type'];
    final type = rawType is String ? rawType : null;
    return switch (status) {
      401 => ApiUnauthorized(title: title, detail: detail, type: type),
      403 => ApiForbidden(title: title, detail: detail, type: type),
      404 => ApiNotFound(title: title, detail: detail, type: type),
      400 || 409 || 422 => ApiValidation(
        title: title,
        detail: detail,
        statusCode: status,
        type: type,
        errors: _parseErrors(json['errors']),
      ),
      final int s when s >= 500 && s < 600 => ApiServer(
        title: title,
        detail: detail,
        statusCode: s,
        type: type,
      ),
      _ => ApiUnknown(
        title: title,
        detail: detail,
        statusCode: status,
        type: type,
      ),
    };
  }

  final String? title;
  final String? detail;
  final int? statusCode;
  final String? type;

  static Map<String, List<String>> _parseErrors(Object? raw) {
    if (raw is! Map) return const {};
    return {
      for (final e in raw.entries)
        e.key.toString(): e.value is List
            ? [for (final m in e.value as List) m.toString()]
            : [e.value.toString()],
    };
  }

  @override
  String toString() => '$runtimeType(status: $statusCode, title: $title)';
}

final class ApiNetwork extends ApiFailure {
  const ApiNetwork() : super();
}

final class ApiUnauthorized extends ApiFailure {
  const ApiUnauthorized({super.title, super.detail, super.type})
    : super(statusCode: 401);
}

final class ApiForbidden extends ApiFailure {
  const ApiForbidden({super.title, super.detail, super.type})
    : super(statusCode: 403);
}

final class ApiNotFound extends ApiFailure {
  const ApiNotFound({super.title, super.detail, super.type})
    : super(statusCode: 404);
}

final class ApiValidation extends ApiFailure {
  const ApiValidation({
    super.title,
    super.detail,
    super.statusCode = 422,
    super.type,
    this.errors = const {},
  });

  /// Field name to messages, when the server provides an `errors` map.
  final Map<String, List<String>> errors;
}

final class ApiServer extends ApiFailure {
  const ApiServer({super.title, super.detail, super.statusCode, super.type});
}

final class ApiUnknown extends ApiFailure {
  const ApiUnknown({super.title, super.detail, super.statusCode, super.type});
}

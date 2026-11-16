import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/core/errors/api_failure.dart';

void main() {
  Map<String, dynamic> problem(int status) => {
    'type': 'about:blank',
    'title': 'Titre',
    'status': status,
    'detail': 'Detail',
    'instance': '/x',
  };

  test('maps status codes to failure types', () {
    expect(ApiFailure.fromProblemJson(problem(401)), isA<ApiUnauthorized>());
    expect(ApiFailure.fromProblemJson(problem(403)), isA<ApiForbidden>());
    expect(ApiFailure.fromProblemJson(problem(404)), isA<ApiNotFound>());
    expect(ApiFailure.fromProblemJson(problem(422)), isA<ApiValidation>());
    expect(ApiFailure.fromProblemJson(problem(503)), isA<ApiServer>());
    expect(ApiFailure.fromProblemJson(problem(418)), isA<ApiUnknown>());
  });

  test('keeps problem fields', () {
    final f = ApiFailure.fromProblemJson(problem(500));
    expect(f.title, 'Titre');
    expect(f.detail, 'Detail');
    expect(f.type, 'about:blank');
    expect(f.statusCode, 500);
  });

  test('falls back to statusCode argument when status is missing', () {
    final f = ApiFailure.fromProblemJson({}, statusCode: 404);
    expect(f, isA<ApiNotFound>());
  });

  test('parses validation errors', () {
    final f = ApiFailure.fromProblemJson({
      'status': 422,
      'errors': {
        'email': ['invalide'],
      },
    }) as ApiValidation;
    expect(f.errors['email'], ['invalide']);
  });

  test('tolerates wrong field types and network failure', () {
    final f = ApiFailure.fromProblemJson({'title': 1, 'status': 'x'});
    expect(f, isA<ApiUnknown>());
    expect(f.title, isNull);
    expect(const ApiNetwork(), isA<ApiFailure>());
  });
}

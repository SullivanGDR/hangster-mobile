import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/features/home/presentation/countdown.dart';

void main() {
  final now = DateTime(2026, 11, 16, 14, 10);

  Countdown to(DateTime target) => Countdown.between(now: now, target: target);

  test('ce soir', () {
    final c = to(DateTime(2026, 11, 16, 19, 30));
    expect(c.phase, CountdownPhase.tonight);
    expect((c.days, c.hours, c.minutes), (0, 5, 20));
  });

  test('aujourd hui avant 18 h', () {
    expect(to(DateTime(2026, 11, 16, 16)).phase, CountdownPhase.today);
  });

  test('demain', () {
    final c = to(DateTime(2026, 11, 17, 9, 15));
    expect(c.phase, CountdownPhase.tomorrow);
    expect((c.days, c.hours, c.minutes), (0, 19, 5));
  });

  test('dans plusieurs jours', () {
    final c = to(DateTime(2026, 11, 18, 19, 30));
    expect(c.phase, CountdownPhase.later);
    expect(c.daysAway, 2);
    expect((c.days, c.hours, c.minutes), (2, 5, 20));
  });

  test('passé ou en cours', () {
    expect(to(DateTime(2026, 11, 16, 14, 10)).phase, CountdownPhase.started);
    expect(to(DateTime(2026, 11, 15, 20)).phase, CountdownPhase.started);
  });
}

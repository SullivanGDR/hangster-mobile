/// Où se situe la sortie par rapport à maintenant.
enum CountdownPhase { started, tonight, today, tomorrow, later }

/// Compte à rebours calculé à partir d'une horloge injectée.
class Countdown {
  const Countdown({
    required this.phase,
    this.days = 0,
    this.daysAway = 0,
    this.hours = 0,
    this.minutes = 0,
  });

  factory Countdown.between({required DateTime now, required DateTime target}) {
    final diff = target.difference(now);
    if (diff <= Duration.zero) {
      return const Countdown(phase: CountdownPhase.started);
    }
    final total = diff.inMinutes;
    final dayGap = DateTime.utc(
      target.year,
      target.month,
      target.day,
    ).difference(DateTime.utc(now.year, now.month, now.day)).inDays;
    final phase = switch (dayGap) {
      0 when target.hour >= _eveningHour => CountdownPhase.tonight,
      0 => CountdownPhase.today,
      1 => CountdownPhase.tomorrow,
      _ => CountdownPhase.later,
    };
    return Countdown(
      phase: phase,
      daysAway: dayGap,
      days: total ~/ _minutesPerDay,
      hours: total % _minutesPerDay ~/ _minutesPerHour,
      minutes: total % _minutesPerHour,
    );
  }

  static const int _eveningHour = 18;
  static const int _minutesPerHour = 60;
  static const int _minutesPerDay = 1440;

  final CountdownPhase phase;
  final int days;

  /// Écart en jours calendaires (J-n).
  final int daysAway;
  final int hours;
  final int minutes;
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/clock/clock.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/todo_item.dart';
import 'home_card.dart';

/// Section « À faire » : une ligne par action attendue.
class TodoSection extends StatelessWidget {
  const TodoSection({required this.todos, super.key});

  final List<TodoItem> todos;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(l10n.homeTodoTitle, style: AppTextStyles.sectionTitle),
        ),
        for (final todo in todos) ...[
          const SizedBox(height: AppDimens.homeTightGap),
          _TodoRow(todo: todo),
        ],
      ],
    );
  }
}

class _TodoRow extends ConsumerWidget {
  const _TodoRow({required this.todo});

  final TodoItem todo;

  static const int _hoursPerDay = 24;
  static const int _minutesPerHour = 60;

  String _subtitle(AppLocalizations l10n, DateTime now) {
    final due = todo.dueAt;
    if (due == null) return l10n.homeTodoGroup(todo.groupName);
    final minutes = due.difference(now).inMinutes;
    final hours = (minutes / _minutesPerHour).ceil().clamp(1, 1 << 20);
    return hours >= _hoursPerDay
        ? l10n.homeTodoDueDays(todo.groupName, hours ~/ _hoursPerDay)
        : l10n.homeTodoDueHours(todo.groupName, hours);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final now = ref.watch(clockProvider)();
    final isVote = todo.type == TodoType.vote;
    final target = todo.targetDate;
    final title = !isVote
        ? l10n.homeTodoAvailability
        : target == null
        ? l10n.homeTodoVoteNoDate
        : l10n.homeTodoVote(target);
    final action = isVote
        ? l10n.homeTodoVoteAction
        : l10n.homeTodoAvailabilityAction;
    return HomeCard(
      radius: AppDimens.radiusCard,
      outlined: true,
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.cardPaddingV,
        horizontal: AppDimens.cardPaddingH,
      ),
      onTap: () => context.go(AppRoutes.outings),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyStrong),
                Text(_subtitle(l10n, now), style: AppTextStyles.meta),
              ],
            ),
          ),
          const SizedBox(width: AppDimens.homeCardGap),
          // Visuel seul : toute la carte est la cible tactile.
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.encre,
              borderRadius: BorderRadius.circular(AppDimens.radiusPill),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimens.pillPaddingV,
                horizontal: AppDimens.pillPaddingH,
              ),
              child: Text(action, style: AppTextStyles.pill),
            ),
          ),
        ],
      ),
    );
  }
}

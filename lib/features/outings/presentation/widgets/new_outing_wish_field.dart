import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../outing_planner_providers.dart';

/// Champ d'envie en texte libre (bord Encre) et étiquettes détectées.
class NewOutingWishField extends ConsumerStatefulWidget {
  const NewOutingWishField({super.key});

  @override
  ConsumerState<NewOutingWishField> createState() => _NewOutingWishFieldState();
}

class _NewOutingWishFieldState extends ConsumerState<NewOutingWishField> {
  late final TextEditingController _controller = TextEditingController(
    text: ref.read(outingDraftControllerProvider).wish,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppDimens.outingWishPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
        border: Border.all(
          color: AppColors.encre,
          width: AppDimens.borderWidthFocus,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            minLines: AppDimens.outingWishMinLines,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            style: AppTextStyles.wishInput,
            cursorColor: AppColors.encre,
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              filled: false,
              hintText: l10n.newOutingWishHint,
              hintStyle: AppTextStyles.wishHint,
              semanticCounterText: null,
            ),
            onChanged: ref.read(outingDraftControllerProvider.notifier).setWish,
          ),
          Consumer(
            builder: (context, ref, _) {
              final tags =
                  ref.watch(outingWishTagsProvider).value ?? const <String>[];
              if (tags.isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(top: AppDimens.outingWishGap),
                child: Wrap(
                  spacing: AppDimens.outingTagGap,
                  runSpacing: AppDimens.outingTagGap,
                  children: [for (final tag in tags) _TagPill(label: tag)],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  const _TagPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.outingTagPaddingV,
        horizontal: AppDimens.outingTagPaddingH,
      ),
      decoration: BoxDecoration(
        color: AppColors.braiseDouce,
        borderRadius: BorderRadius.circular(AppDimens.radiusPill),
      ),
      child: Text(label, style: AppTextStyles.tag),
    );
  }
}

import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../shared/widgets/app_button.dart';

/// Message avec une action : liste vide ou erreur, jamais d'impasse.
class ProposalMessage extends StatelessWidget {
  const ProposalMessage({
    required this.body,
    required this.actionLabel,
    required this.onAction,
    required this.actionVariant,
    this.title,
    super.key,
  });

  final String? title;
  final String body;
  final String actionLabel;
  final VoidCallback onAction;
  final AppButtonVariant actionVariant;

  @override
  Widget build(BuildContext context) {
    final heading = title;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading != null) ...[
          Semantics(
            header: true,
            child: Text(heading, style: AppTextStyles.title),
          ),
          const SizedBox(height: AppDimens.spaceS),
        ],
        Text(
          body,
          style: AppTextStyles.body.copyWith(color: AppColors.encreDouce),
        ),
        const SizedBox(height: AppDimens.spaceL),
        AppButton(
          label: actionLabel,
          onPressed: onAction,
          variant: actionVariant,
        ),
      ],
    );
  }
}

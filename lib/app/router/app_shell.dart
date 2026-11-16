import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';
import 'app_router.dart';

/// Coque de navigation : contenu + barre du bas a 5 entrees.
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _select(int branch) => navigationShell.goBranch(
    branch,
    initialLocation: branch == navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final current = navigationShell.currentIndex;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.blanc,
          border: Border(top: BorderSide(color: AppColors.ligneNav)),
        ),
        child: SafeArea(
          child: SizedBox(
            height: AppDimens.navBarHeight,
            child: Padding(
              padding: const EdgeInsets.only(top: AppDimens.navPaddingTop),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _NavItem(
                    icon: LucideIcons.house,
                    label: l10n.navHome,
                    selected: current == 0,
                    onTap: () => _select(0),
                  ),
                  _NavItem(
                    icon: LucideIcons.calendar,
                    label: l10n.navOutings,
                    selected: current == 1,
                    onTap: () => _select(1),
                  ),
                  Expanded(child: _NewOutingButton(label: l10n.navNewOuting)),
                  _NavItem(
                    icon: LucideIcons.users,
                    label: l10n.navGroups,
                    selected: current == 2,
                    onTap: () => _select(2),
                  ),
                  _NavItem(
                    icon: LucideIcons.user,
                    label: l10n.navProfile,
                    selected: current == 3,
                    onTap: () => _select(3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final style = selected
        ? AppTextStyles.navLabelActive
        : AppTextStyles.navLabel;
    return Expanded(
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        excludeSemantics: true,
        onTap: onTap,
        child: InkResponse(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: AppDimens.minTouchTarget,
              minWidth: AppDimens.minTouchTarget,
            ),
            child: Column(
              children: [
                Icon(icon, color: style.color, size: AppDimens.navIconSize),
                const SizedBox(height: AppDimens.navItemGap),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NewOutingButton extends StatelessWidget {
  const _NewOutingButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Transform.translate(
        offset: const Offset(0, -AppDimens.newOutingLift),
        child: Semantics(
          button: true,
          label: label,
          excludeSemantics: true,
          onTap: () => context.push(AppRoutes.newOuting),
          child: Material(
            color: AppColors.braise,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => context.push(AppRoutes.newOuting),
              child: const SizedBox.square(
                dimension: AppDimens.newOutingButtonSize,
                child: Icon(
                  LucideIcons.plus,
                  color: AppColors.encre,
                  size: AppDimens.navIconSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

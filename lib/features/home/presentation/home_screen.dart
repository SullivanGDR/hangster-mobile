import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/router/app_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/sun_loader.dart';
import '../domain/home_overview.dart';
import 'home_providers.dart';
import 'widgets/free_friends_banner.dart';
import 'widgets/home_header.dart';
import 'widgets/home_message_view.dart';
import 'widgets/ideas_section.dart';
import 'widgets/next_outing_card.dart';
import 'widgets/todo_section.dart';

/// Accueil : prochaine sortie, choses à faire, amis libres ce soir.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final overview = ref.watch(homeOverviewProvider);

    Future<void> refresh() async {
      ref.invalidate(homeOverviewProvider);
      try {
        await ref.read(homeOverviewProvider.future);
      } on Object {
        // L'erreur s'affiche via l'état du provider.
      }
    }

    return Scaffold(
      backgroundColor: AppColors.blanc,
      body: overview.when(
        skipError: true,
        loading: () => SafeArea(
          child: Center(child: SunLoader(semanticLabel: l10n.loadingLabel)),
        ),
        error: (_, _) => _Body(
          onRefresh: refresh,
          children: [
            const _Padded(child: HomeHeader()),
            _Padded(
              child: HomeMessageView(
                body: l10n.homeErrorBody,
                actionLabel: l10n.errorRetry,
                actionVariant: AppButtonVariant.strong,
                onAction: () => ref.invalidate(homeOverviewProvider),
              ),
            ),
          ],
        ),
        data: (data) => _Body(
          onRefresh: refresh,
          refreshing: overview.isRefreshing,
          children: _dataChildren(context, data),
        ),
      ),
    );
  }

  List<Widget> _dataChildren(BuildContext context, HomeOverview data) {
    final l10n = AppLocalizations.of(context);
    final outing = data.nextOuting;
    final header = _Padded(
      child: HomeHeader(unreadNotifications: data.unreadNotifications),
    );
    if (data.isEmpty) {
      return [
        header,
        _Padded(
          child: HomeMessageView(
            title: l10n.homeEmptyTitle,
            body: l10n.homeEmptyBody,
            actionLabel: l10n.homeEmptyAction,
            actionVariant: AppButtonVariant.primary,
            onAction: () => context.go(AppRoutes.newOuting),
          ),
        ),
      ];
    }
    return [
      header,
      if (outing != null) _Padded(child: NextOutingCard(outing: outing)),
      if (data.freeFriends.isNotEmpty)
        _Padded(child: FreeFriendsBanner(friends: data.freeFriends)),
      if (data.todos.isNotEmpty) _Padded(child: TodoSection(todos: data.todos)),
      if (data.ideas.isNotEmpty) IdeasSection(ideas: data.ideas),
    ];
  }
}

class _Padded extends StatelessWidget {
  const _Padded({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppDimens.homeSidePadding),
    child: child,
  );
}

/// Contenu défilant, centré et borné sur grand écran, avec rafraîchissement.
class _Body extends StatelessWidget {
  const _Body({
    required this.children,
    required this.onRefresh,
    this.refreshing = false,
  });

  final List<Widget> children;
  final Future<void> Function() onRefresh;
  final bool refreshing;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final top = math.max(
      AppDimens.homeTopPadding,
      MediaQuery.paddingOf(context).top + AppDimens.spaceM,
    );
    return RefreshIndicator(
      onRefresh: onRefresh,
      // Pas de cercle visible : le soleil indique le rafraîchissement.
      color: AppColors.blanc,
      backgroundColor: AppColors.blanc,
      elevation: 0,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: top, bottom: AppDimens.homeBottomPadding),
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppDimens.contentMaxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AppDimens.homeBlockGap,
                children: [
                  if (refreshing)
                    Center(
                      child: SunLoader(
                        semanticLabel: l10n.loadingLabel,
                        width: AppDimens.refreshLoaderWidth,
                      ),
                    ),
                  ...children,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

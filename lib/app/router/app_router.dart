import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../features/groups/presentation/groups_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/invitation/presentation/invitation_screen.dart';
import '../../features/outings/presentation/new_outing_screen.dart';
import '../../features/outings/presentation/outings_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import 'app_shell.dart';

/// Chemins de l'application.
abstract final class AppRoutes {
  static const String home = '/';
  static const String outings = '/outings';
  static const String newOuting = '/outings/new';
  static const String groups = '/groups';
  static const String profile = '/profile';
  static const String invitationPattern = '/i/:code';

  static String invitation(String code) => '/i/$code';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

/// Routeur de l'application.
final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.outings,
                builder: (context, state) => const OutingsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.groups,
                builder: (context, state) => const GroupsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.newOuting,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NewOutingScreen(),
      ),
      GoRoute(
        path: AppRoutes.invitationPattern,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) =>
            InvitationScreen(code: state.pathParameters['code'] ?? ''),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});

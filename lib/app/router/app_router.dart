import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../features/auth/presentation/auth_form_support.dart';
import '../../features/auth/presentation/auth_providers.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/groups/presentation/groups_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/invitation/presentation/invitation_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/outings/presentation/new_outing_screen.dart';
import '../../features/outings/presentation/outings_screen.dart';
import '../../features/outings/presentation/proposals_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import 'app_shell.dart';

/// Chemins de l'application.
abstract final class AppRoutes {
  static const String home = '/';
  static const String outings = '/outings';
  static const String newOuting = '/outings/new';
  static const String proposals = '/outings/new/proposals';
  static const String groups = '/groups';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String onboarding = '/onboarding';
  static const String invitationPattern = '/i/:code';

  static String invitation(String code) => '/i/$code';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

/// Routeur de l'application.
final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(authControllerProvider, (_, _) => refresh.value++);
  final router = GoRouter(
    refreshListenable: refresh,
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      if (auth.isLoading) return null;
      final path = state.uri.path;
      final isAuthPage = path == AppRoutes.login || path == AppRoutes.signup;
      if (auth.value == null) {
        final isPublic = isAuthPage || path.startsWith('/i/');
        return isPublic ? null : AppRoutes.login;
      }
      if (!isAuthPage) return null;
      final from = validFromPath(state.uri.queryParameters['from']);
      if (path == AppRoutes.signup) {
        return from == null
            ? AppRoutes.onboarding
            : Uri(
                path: AppRoutes.onboarding,
                queryParameters: {'from': from},
              ).toString();
      }
      return from ?? AppRoutes.home;
    },
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
        path: AppRoutes.login,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) =>
            LoginScreen(from: state.uri.queryParameters['from']),
      ),
      GoRoute(
        path: AppRoutes.signup,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) =>
            SignupScreen(from: state.uri.queryParameters['from']),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.newOuting,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NewOutingScreen(),
      ),
      GoRoute(
        path: AppRoutes.proposals,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ProposalsScreen(),
      ),
      GoRoute(
        path: AppRoutes.invitationPattern,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) =>
            InvitationScreen(code: state.pathParameters['code'] ?? ''),
      ),
    ],
  );
  ref.onDispose(() {
    router.dispose();
    refresh.dispose();
  });
  return router;
});

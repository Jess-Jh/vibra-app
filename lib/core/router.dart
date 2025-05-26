import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibra/features/auth/presentation/pages/login_page.dart';
import 'package:vibra/features/auth/presentation/providers/auth_provider.dart';
import 'package:vibra/features/home/presentation/pages/home_page.dart';
import 'package:vibra/features/search/presentation/pages/search_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.login,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
      GoRoute(
        path: Routes.search,
        builder: (context, state) => const SearchPage(),
      ),
    ],
    redirect: (context, state) {
      final auth = ref.read(authProvider);
      final goingToLogin = state.uri.path == Routes.login;

      if (auth.token == null && !goingToLogin) {
        return Routes.login;
      } else if (auth.token != null && goingToLogin) {
        return Routes.home;
      }
      return null;
    },
  );
});

class Routes {
  Routes._();
  static final String login = '/login';
  static final String home = '/home';
  static final String search = '/search';
}

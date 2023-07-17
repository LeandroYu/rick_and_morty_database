import 'package:go_router/go_router.dart';

import '../../../view/navigator.dart';
import '../../../view/splash/splash_view.dart';

class RouterBaseConfig {
  RouterBaseConfig._();

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: '/navigator', builder: (context, state) => const NavigatorView()),
    ],
  );
}

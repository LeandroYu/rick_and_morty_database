import 'package:go_router/go_router.dart';

class RouterBaseConfig {
  RouterBaseConfig._();

  static GoRouter router = GoRouter(
    routes: <RouteBase>[],
  );
}

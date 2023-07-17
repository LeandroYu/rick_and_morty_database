import 'package:flutter/material.dart';

import 'core/config/router/router_base_config.dart';
import 'core/injection/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injection().inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: RouterBaseConfig.router,
    );
  }
}

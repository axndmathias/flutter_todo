import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import '../routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter To Do',
      routerConfig:
          Routefly.routerConfig(routes: routes, initialPath: routePaths.splash),
    );
  }
}

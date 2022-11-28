import 'package:flutter/material.dart';

import 'common/routes/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goRouter = PageRouter();
    final router = goRouter.goRouter;
    return MaterialApp(
      home: Router(
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
      ),
    );
  }
}

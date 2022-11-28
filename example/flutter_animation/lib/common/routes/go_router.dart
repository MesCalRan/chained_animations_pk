import 'package:flutter/animation.dart';
import 'package:go_router/go_router.dart';

import '../../screens/animation_one_screen/animation_one_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../animations/custom_page_transitions/custom_page_transitions.dart';

class PageRouter {
  PageRouter() {
    init();
  }

  late GoRouter goRouter;

  void init() {
    final CustomPageTransitions customPageTransitions = CustomPageTransitions();
    goRouter = GoRouter(routes: <GoRoute>[
      GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) {
            return const HomeScreen();
          },
          routes: [
            GoRoute(
                path: 'animation_one_screen',
                name: 'animationOneScreen',
                pageBuilder: (context, state) {
                  return customPageTransitions.pageTransition(
                      child: const AnimationOneScreen(),
                      transition: TransitionType.popUp,
                      duration: const Duration(milliseconds: 250),
                      curves: Curves.easeIn,
                      initialScale: 0.5,
                      targetScale: 1);
                }),
          ]),
    ]);
  }

  void routeToHome() {
    goRouter.goNamed('home');
  }
}

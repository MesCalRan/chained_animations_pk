import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomPageTransitions {
  Page pageTransition({
    required Widget child,
    TransitionType? transition,
    Duration? duration,
    Curve? curves,
    Curve? reverseCurve,
    double? initialScale,
    double? targetScale,
    Offset? initialOffset,
    Offset? targetOffset,
  }) {
    switch (transition ?? TransitionType.cupertinoTransition) {
      case TransitionType.cupertinoTransition:
        return CupertinoPage(child: child);

      case TransitionType.fade:
        return CustomTransitionPage(
          opaque: false,
          child: child,
          transitionDuration: duration ?? const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              curve: curves ?? Curves.easeIn,
              reverseCurve: reverseCurve ?? Curves.easeOut,
              parent: animation,
            );

            return FadeTransition(
              opacity: curvedAnimation,
              child: child,
            );
          },
        );

      case TransitionType.popUp:
        return CustomTransitionPage(
          opaque: false,
          child: child,
          transitionDuration: duration ?? const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween =
                Tween(begin: initialScale ?? 0, end: targetScale ?? 1).chain(
              CurveTween(curve: curves ?? Curves.easeIn),
            );

            return ScaleTransition(
              scale: animation.drive(tween),
              child: child,
            );
          },
        );

      case TransitionType.slideRight:
        return CustomTransitionPage(
          opaque: false,
          child: child,
          transitionDuration: duration ?? const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slideTween = Tween<Offset>(
              begin: initialOffset ?? const Offset(-1, 0),
              end: targetOffset ?? Offset.zero,
            ).chain(CurveTween(curve: curves ?? Curves.easeIn));

            return SlideTransition(
              position: animation.drive(slideTween),
              child: child,
            );
          },
        );
    }
  }
}

enum TransitionType {
  cupertinoTransition,
  fade,
  slideRight,
  popUp,
}

import 'package:flutter/animation.dart';

abstract class ChainedAnimationController {
  ChainedAnimationController({
    required this.duration,
    required this.curve,
  });

  late Duration duration;

  final Curve curve;

  Function()? onStop;

  void stop() {
    onStop?.call();
  }
}

class EmphasisController extends ChainedAnimationController {
  EmphasisController({
    required super.duration,
    required super.curve,
  });

  Function()? onEmphasize;

  void emphasize() {
    onEmphasize?.call();
  }
}

class EntranceExitController extends ChainedAnimationController {
  EntranceExitController({
    required super.duration,
    required super.curve,
  });

  Function()? onEnter;
  Function()? onExit;

  Future<void> enter() async {
    onEnter?.call();
  }

  Future<void> exit() async {
    onExit?.call();
  }
}

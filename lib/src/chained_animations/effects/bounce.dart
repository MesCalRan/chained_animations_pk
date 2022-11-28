import 'package:flutter/material.dart';

import '../chained_animations_controller.dart';

class Bounce extends StatefulWidget {
  const Bounce({
    required this.controller,
    required this.child,
    this.initial = 0,
    this.end = 16,
    Key? key,
  }) : super(key: key);

  final EmphasisController controller;
  final Widget child;
  final double initial;
  final double end;

  @override
  State<Bounce> createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late EmphasisController controller;
  late Animatable<Offset> tween;
  late Animation<Offset> offsetAnimation;
  bool bounce = false;

  @override
  void initState() {
    controller = widget.controller;
    animationController = AnimationController(
      vsync: this,
      duration: controller.duration,
    );
    tween =
        Tween(begin: Offset(0, -widget.end), end: Offset(0, -widget.initial))
            .chain(
      CurveTween(curve: controller.curve),
    );
    offsetAnimation = animationController.drive(tween);
    controller.onEmphasize = () {
      animationController.repeat(reverse: true);
    };
    controller.onStop = () {
      animationController.stop();
    };
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: offsetAnimation.value,
            child: widget.child,
          );
        });
  }
}

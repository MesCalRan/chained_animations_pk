import 'package:flutter/material.dart';

import '../chained_animations_controller.dart';

class GrowShrink extends StatefulWidget {
  const GrowShrink({
    required this.controller,
    required this.child,
    this.initial = 0,
    this.end = 1,
    Key? key,
  }) : super(key: key);

  final EntranceExitController controller;
  final Widget child;
  final double initial;
  final double end;

  @override
  State<GrowShrink> createState() => _GrowShrinkState();
}

class _GrowShrinkState extends State<GrowShrink> {
  late EntranceExitController controller;
  bool grow = false;

  @override
  void initState() {
    controller = widget.controller;
    controller.onEnter = () {
      setState(() {
        grow = true;
      });
    };
    controller.onExit = () {
      setState(() {
        grow = false;
      });
    };
    controller.onStop = () {
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: grow ? widget.end : widget.initial,
      duration: widget.controller.duration,
      curve: widget.controller.curve,
      child: widget.child,
    );
  }
}

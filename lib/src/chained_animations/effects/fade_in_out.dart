import 'package:flutter/material.dart';

import '../chained_animations_controller.dart';

class FadeInOut extends StatefulWidget {
  const FadeInOut({
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
  State<FadeInOut> createState() => _FadeInOutState();
}

class _FadeInOutState extends State<FadeInOut> {
  late EntranceExitController controller;
  bool appear = false;

  @override
  void initState() {
    controller = widget.controller;
    controller.onEnter = () {
      setState(() {
        appear = true;
      });
    };
    controller.onExit = () {
      setState(() {
        appear = false;
      });
    };
    controller.onStop = () {
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: appear ? widget.end : widget.initial,
      duration: widget.controller.duration,
      curve: widget.controller.curve,
      child: widget.child,
    );
  }
}

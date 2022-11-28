import 'package:flutter/material.dart';

import '../chained_animations_controller.dart';

class Spin extends StatefulWidget {
  const Spin({
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
  State<Spin> createState() => _SpinState();
}

class _SpinState extends State<Spin> {
  late EntranceExitController controller;
  bool rotate = false;

  @override
  void initState() {
    controller = widget.controller;
    controller.onEnter = () {
      setState(() {
        rotate = true;
      });
    };
    controller.onExit = () {
      setState(() {
        rotate = false;
      });
    };
    controller.onStop = () {
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: rotate ? widget.end : widget.initial,
      duration: widget.controller.duration,
      curve: widget.controller.curve,
      child: widget.child,
    );
  }
}

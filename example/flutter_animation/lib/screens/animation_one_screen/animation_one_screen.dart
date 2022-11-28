import 'package:flutter/material.dart';

import '../../common/animations/chained_animations/chained_animations.dart';
import '../../common/animations/chained_animations/chained_animations_controller.dart';
import '../../common/animations/chained_animations/effects/bounce.dart';
import '../../common/animations/chained_animations/effects/fade_in_out.dart';
import '../../common/animations/chained_animations/effects/grow_shrink.dart';
import '../../common/animations/chained_animations/effects/spin.dart';

class AnimationOneScreen extends StatefulWidget {
  const AnimationOneScreen({Key? key}) : super(key: key);

  @override
  State<AnimationOneScreen> createState() => _AnimationOneScreenState();
}

class _AnimationOneScreenState extends State<AnimationOneScreen>
    with SingleTickerProviderStateMixin {
  ChainedAnimations chainedAnimations = ChainedAnimations();

  late EntranceExitController controller1;
  late EntranceExitController controller2;
  late EntranceExitController controller3;
  late EntranceExitController controller4;
  late EmphasisController controller5;

  @override
  void initState() {
    controller1 = EntranceExitController(
      duration: const Duration(seconds: 4),
      curve: Curves.easeIn,
    );
    controller2 = EntranceExitController(
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
    controller3 = EntranceExitController(
      duration: const Duration(seconds: 2),
      curve: Curves.linear,
    );
    controller4 = EntranceExitController(
      duration: const Duration(seconds: 2),
      curve: Curves.linear,
    );
    controller5 = EmphasisController(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );

    chainedAnimations
      ..play(controller: controller5)
      ..play(controller: controller1)
      ..play(controller: controller4)
      ..play(controller: controller2)
      ..stopAfter(controller: controller4)
      ..play(controller: controller3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 52),
            Bounce(
              controller: controller5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.blue,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeInOut(
              controller: controller1,
              child: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 16),
            Spin(
              controller: controller2,
              child: Container(
                color: Colors.lightBlue,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 16),
            GrowShrink(
              controller: controller3,
              child: Container(
                color: Colors.blueGrey,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 16),
            FadeInOut(
              controller: controller4,
              child: Container(
                color: Colors.blueAccent,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                chainedAnimations.animate();
              },
              child: const Text('Forward Animate'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                chainedAnimations.exitAnimate();
              },
              child: const Text('Reverse Animate'),
            ),
          ],
        ),
      ),
    );
  }
}

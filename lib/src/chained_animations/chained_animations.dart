import 'dart:async';

import 'chained_animations_controller.dart';
import 'execution.dart';

class ChainedAnimations {
  List<Execution> executions = [];

  void play({required ChainedAnimationController controller}) {
    executions.add(Play(controller: controller));
  }

  void playAfter({required ChainedAnimationController controller}) {
    executions.add(PlayAfter(controller: controller));
  }

  void stop({required ChainedAnimationController controller}) {
    executions.add(Stop(controller: controller));
  }

  void stopAfter({required ChainedAnimationController controller}) {
    executions.add(StopAfter(controller: controller));
  }

  void delay({required Duration duration}) {
    executions.add(Delay(waitingDuration: duration));
  }

  Future<void> animate() async {
    for (int i = 0; i < executions.length; i++) {
      final Execution execution = executions[i];
      final Execution? previousExecution = i < 1 ? null : executions[i - 1];
      final Execution? nextExecution =
          i >= executions.length - 1 ? null : executions[i + 1];

      if (execution is Play) {
        final controller = execution.controller;

        if (controller is EntranceExitController) {
          unawaited(controller.enter());
        } else if (controller is EmphasisController) {
          controller.emphasize();
        }
      } else if (execution is PlayAfter) {
        final controller = execution.controller;

        if (previousExecution != null) {
          await Future.delayed(previousExecution.waitingDuration);
        }

        if (controller is EntranceExitController) {
          unawaited(controller.enter());
        } else if (controller is EmphasisController) {
          controller.emphasize();
        }
      } else if (execution is Stop) {
        final controller = execution.controller;

        controller.stop();
      } else if (execution is StopAfter) {
        final controller = execution.controller;

        if (previousExecution != null) {
          await Future.delayed(previousExecution.waitingDuration);
        }

        controller.stop();
      } else if (execution is Delay) {
        await Future.delayed(execution.waitingDuration);
      }
    }
  }

  Future<void> exitAnimate() async {
    for (int i = executions.length; i > 0; i--) {
      final Execution execution = executions[i - 1];
      final Execution? previousExecution = i < 2 ? null : executions[i - 2];
      final Execution? nextExecution =
          i >= executions.length - 1 ? null : executions[i + 1];

      if (execution is Play) {
        final controller = execution.controller;

        if (controller is EntranceExitController) {
          unawaited(controller.exit());
        }

        if (previousExecution is StopAfter || previousExecution is PlayAfter) {
          await Future.delayed(execution.waitingDuration);
        }
      } else if (execution is PlayAfter) {
        final controller = execution.controller;

        if (controller is EntranceExitController) {
          unawaited(controller.exit());
        }
      } else if (execution is Stop) {
        final controller = execution.controller;

        if (controller is EntranceExitController) {
          unawaited(controller.exit());
        }
      } else if (execution is StopAfter) {
        final controller = execution.controller;

        if (controller is EntranceExitController) {
          unawaited(controller.exit());
        }
      } else if (execution is Delay) {
        await Future.delayed(execution.waitingDuration);
      }
    }
  }
}

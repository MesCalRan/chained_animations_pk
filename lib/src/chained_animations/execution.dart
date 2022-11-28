import 'chained_animations_controller.dart';

abstract class Execution {
  const Execution();

  Duration get waitingDuration;
}

class Play extends Execution {
  const Play({required this.controller});

  final ChainedAnimationController controller;

  @override
  Duration get waitingDuration => controller.duration ?? Duration.zero;
}

class PlayAfter extends Execution {
  const PlayAfter({required this.controller});

  final ChainedAnimationController controller;

  @override
  Duration get waitingDuration => controller.duration ?? Duration.zero;
}

class Stop extends Execution {
  const Stop({required this.controller});

  final ChainedAnimationController controller;

  @override
  Duration get waitingDuration => Duration.zero;
}

class StopAfter extends Execution {
  const StopAfter({required this.controller});

  final ChainedAnimationController controller;

  @override
  Duration get waitingDuration => Duration.zero;
}

class Delay extends Execution {
  const Delay({required this.waitingDuration});

  @override
  final Duration waitingDuration;
}

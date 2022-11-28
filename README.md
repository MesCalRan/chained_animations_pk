Description:
•A simple package for chaining animations with some effects.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to start using the package.

## Usage

•Declare some controllers in a stateful widget like this;

late EntranceExitController entranceExitController;
late EmphasisController emphasisController;

<-------------------------------------------------->

•Give the controllers a duration and curve.
•You can put this inside the initState.

entranceExitController = EntranceExitController(
duration: const Duration(seconds: 4), curve: Curves.easeIn,
);

emphasisController = EmphasisController(
duration: const Duration(milliseconds: 500), curve: Curves.easeIn,
);

<-------------------------------------------------->

•Then put this in a button or a function.

chainedAnimations ..play(controller: entranceExitController)
..play(controller: emphasisController);

<-------------------------------------------------->

•Finally, you can call these two to either play or reverse your animations. •Emphasis animations are
not affected.

chainedAnimations.animate(); //Play
chainedAnimations.exitAnimate(); //Reverse

<-------------------------------------------------->

•You may refer to the example project in /example

## Additional information

•May add new effects in the future
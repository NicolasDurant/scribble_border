# Scribble Border

Scribble Border creates a visual border effect around a provided Widget. The aim of this border is to look like a user has drawn a rectangle or round shape around the provided child.
Since this is not a real Border it can be used around every visual Widget. Scribble Border also has a BackgroundPaint class, which can be used to fill a background with a Gradient.

![Example](https://github.com/NicolasDurant/stick_it/blob/main/example/assets/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-08-30%20at%2015.36.09.gif)

## Getting Started

Add [scribble_border](https://pub.dev/packages/scribble_border) as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
You can also check the [installing page](https://pub.dev/packages/scribble_border/install).
Check out the [example page](https://pub.dev/packages/scribble_border/example) or down below, for an example implementation of the package.

## Usage

Import the library via
```dart
import 'package:scribble_border/scribble_border.dart';
```

### Example
```dart
import 'package:flutter/material.dart';
import 'package:stick_it/stick_it.dart';

class SimplestExample extends StatelessWidget {
  const SimplestExample({Key? key}) : super(key: key);
  static String routeName = 'simplest-example';
  static String routeTitle = 'Simplest Example';
  final String _background =
      'https://images.unsplash.com/photo-1545147986-a9d6f2ab03b5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeTitle),
      ),
      body: StickIt(
        /// The [StickIt] Class only requires two named parameters.
        ///
        /// [Widget] child - the child that the stickers should be placed upon.
        /// [List<Image>] stickerList - the list of stickers available to the user.
        ///
        /// StickIt supports a lot of styling related optional named parameters,
        /// that you can change and check out in the AdvancedExample. (tbd)
        child: Image.network(_background),
        stickerList: [
          Image.asset('assets/icons8-anubis-48.png'),
          Image.asset('assets/icons8-bt21-shooky-48.png'),
          Image.asset('assets/icons8-fire-48.png'),
          Image.asset('assets/icons8-jake-48.png'),
          Image.asset('assets/icons8-keiji-akaashi-48.png'),
          Image.asset('assets/icons8-mate-48.png'),
          Image.asset('assets/icons8-pagoda-48.png'),
          Image.asset('assets/icons8-spring-48.png'),
          Image.asset('assets/icons8-totoro-48.png'),
          Image.asset('assets/icons8-year-of-dragon-48.png'),
        ],
      ),
    );
  }
}
```

## ScribbleBorder - Supported Parameters
| named parameter             | type           | required | default                                           | description                                                                                                                                                                                                                                                                                        |
|-----------------------------|----------------|----------|---------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| child                       | Widget         | yes      |                                                   | Child to be surrounded by the [ScribbleBorder]                                                                                                                                                                                                                                                            |
| circular  | bool            | no       | false                                                 | If this is set the border will be drawn in a circle shape around the component                                                                                                                                                                                                                                |
| circularRadius     | double         | no       | 0.0                                               | Sets a custom radius for the circle. (only does anything, if circular = true). The default will create a circle with half the width of the component as radius                                                                                                                                                                                                                                   |
| gradient                 | Gradient | no      |         LinearGradient(colors: [Colors.black26, Colors.black12]                                          | The gradient is used for the color-range of a stroke and is always linear for now.                                                                                                                                                                             |
| gradientStretch                 | double         | no       | 0.5                                           | Value that determines how far the gradient of a stroke is stretched out. Bigger values mean less strong gradient. Always from the first color provided in the gradient to the second one. 0.0 means default linear gradient with even distribution.                                                                                                                                                                                                                                                                 |
| padding            | double         | no       | 0                                               | Padding for the [Container] that surrounds the [child]                                                                                                                                                                              |
| painter             | ScribblePainter         | no       |                                                |  Our custom paint to be applied on the border. You don't need to set this                                                                                                                                                                                             |
| randomOffset        | double          | no       | 0.0                                      | Value that determines how far strokes can overlap or how big the gaps can be. Bigger values mean bigger gaps and overlaps. 0.0 means no offset.     |                                                                                                                                                                                                                                                        |
| repaint             | bool         | no       | false                                               | If this is set, the component will repaint when the build method of the parent class is called. Since [ScribbleBorder] works with random values this should be false for the majority of the use cases                                                                                                                                                                                                          |
| strokeWidth | double          | no       | 3.0                                  | Size of the drawn lines                                                                                                                                                                                                                                    |

## BackgroundPaint - Supported Parameters
| named parameter             | type           | required | default                                           | description                                                                                                                                                                                                                                                                                        |
|-----------------------------|----------------|----------|---------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| child                       | Widget         | yes      |                                                   | Child to be surrounded by the [BackgroundPaint]                                                                                                                                                                                                                                                            |
| corners                       | Corners         | no      |            Corners.all(25)                                       | Consisting of 4x [Radius] to determine the radius of the 4 corners of the rectangle to draw. Setting all to 100 will create a circular shape                                                                                                                                                                                                                                                            |
| gradient                 | Gradient | no      |         RadialGradient(colors: [Color.fromARGB(200, 232, 53, 44), Color.fromARGB(255, 224, 15, 4),],)                                          | The gradient is used for the filling color of the background. We take a RadialGradient, which works great with rectangle filling                                                                                                                                                                             |
| padding            | double         | no       | 0                                               | Padding for the [Container] that surrounds the [child]                                                                                                                                                                              |
| painter             | BackgroundPainter         | no       |                                                |  Our custom paint to be applied on the border. You don't need to set this                                                                                                                                                                                             |
| randomOffset        | double          | no       | 0.0                                      | Value that determines how far strokes can overlap or how big the gaps can be. Bigger values mean bigger gaps and overlaps. 0.0 means no offset.     |                                                                                                                                                                                                                                                        |
| randomRadius        | int          | no       | 0.0                                      | Value that determines how far corner radius can randomize. Bigger values mean bigger differences. 0 means no random corners.     |                                                                                                                                                                                                                                                        |
| repaint             | bool         | no       | false                                               | If this is set, the component will repaint when the build method of the parent class is called. Since [ScribbleBorder] works with random values this should be false for the majority of the use cases                                                                                                                                                                                                          |
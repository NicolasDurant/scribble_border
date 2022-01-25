# Scribble Border

Scribble Border creates a visual border effect around a provided Widget. The aim of this border is to look like a user has drawn a rectangle or round shape around the provided child.
Since this is not a real Border it can be used around every visual Widget. Scribble Border also has a BackgroundPaint class, which can be used to fill a background with a Gradient.

|![Example1](https://github.com/NicolasDurant/scribble_border/blob/master/example/assets/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-25%20at%2016.57.20.png)|![Example2](https://github.com/NicolasDurant/scribble_border/blob/master/example/assets/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-25%20at%2016.57.13.png) | ![Example3](https://github.com/NicolasDurant/scribble_border/blob/master/example/assets/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-25%20at%2017.06.15.png)|
|:---:|:---:|:---:|
## Getting Started

Add [scribble_border](https://pub.dev/packages/scribble_border) as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
You can also check the [installing page](https://pub.dev/packages/scribble_border/install).
Check out the [example page](https://pub.dev/packages/scribble_border/example) for a more detailed example or down below, for a simple example implementation of the package.

## Usage

Import the library via
```dart
import 'package:scribble_border/scribble_border.dart';
```

### Example
Refer to the [example.md](https://github.com/NicolasDurant/scribble_border/blob/master/example/example.md) to see how the screenshots are implemented.
```dart
import 'package:flutter/material.dart';
import 'package:scribble_border/scribble_border.dart';

class Example extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScribbleBorder(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.white,
          ),
        ),
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
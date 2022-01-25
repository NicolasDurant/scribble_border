import 'package:flutter/material.dart';

import 'background_painter.dart';

/// [BackgroundPaint] uses the [BackgroundPainter] classes [CustomPainter] to create a visual rectangle background effect underneath a provided [Widget].
/// The aim of this background is to look like a user has drawn a rectangle shape under the provided [child].
/// Since this is not a real background it can be used around every visual [Widget].
class BackgroundPaint extends StatelessWidget {
  BackgroundPaint({
    Key? key,
    required this.child,
    this.gradient = const RadialGradient(
      colors: [
        Color.fromARGB(200, 232, 53, 44),
        Color.fromARGB(255, 224, 15, 4),
      ],
    ),
    this.randomOffset = 0,
    this.randomRadius = 0,
    this.padding = 0,
    this.corners = const Corners(
      Radius.circular(25),
      Radius.circular(25),
      Radius.circular(25),
      Radius.circular(25),
    ),
    this.repaint = false,
  })  : painter = BackgroundPainter(
          gradient: gradient,
          corners: corners,
          randomOffset: randomOffset,
          randomRadius: randomRadius,
          repaint: repaint,
        ),
        super(key: key);

  /// Child to be surrounded by the [BackgroundPaint].
  final Widget child;

  /// The gradient is used for the filling color of the background.
  /// We take a RadialGradient, which works great with rectangle filling.
  final Gradient gradient;

  // Consisting of 4x [Radius] to determine the radius of the 4 corners of the rectangle to draw. Setting all to 100 will create a circular shape.
  final Corners corners;

  /// Padding for the [Container] that surrounds the [child].
  final double padding;

  /// Value that determines how far strokes can overlap or how big the gaps can be.
  /// Bigger values mean bigger gaps and overlaps.
  /// 0 means no offset.
  final int randomOffset;

  /// Value that determines how far corner radius can randomize.
  /// Bigger values mean bigger differences.
  /// 0 means no random corners.
  final int randomRadius;

  /// If this is set, the component will repaint when the build method of the parent class is called.
  /// Since [BackgroundPaint] works with random values this should be false for the majority of the use cases.
  final bool repaint;

  /// Our custom paint to be applied on the border.
  final BackgroundPainter painter;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: Container(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

/// [BackgroundPainter] serves as a [CustomPainter] for the [BackgroundPaint] class.
/// It will draw lines in a rectangle shape around the provided [Widget] in [BackgroundPaint].
/// It takes the size of a [Rect] around provided [child] and a [gradient] to determine its color. [RadientGradient] should be chosen.
/// [BackgroundPaint] uses random values to let the rectangle appear to be drawn by a human with imperfect edges and [Radius] x [Corners].
class BackgroundPainter extends CustomPainter {
  BackgroundPainter({
    required this.corners,
    required this.gradient,
    required this.randomOffset,
    required this.randomRadius,
    required this.repaint,
  });

  // Consisting of 4x [Radius] to determine the radius of the 4 corners of the rectangle to draw.
  final Corners corners;

  /// The gradient is used for the filling color of the background.
  /// We take a RadialGradient, which works great with rectangle filling.
  final Gradient gradient;

  /// Value that determines how far the rectangle can overlap or how big the gaps can be.
  /// Bigger values mean bigger gaps and overlaps of the rectangle..
  /// 0 means no offset.
  final int randomOffset;

  /// Value that determines how far corner radius can randomize.
  /// Bigger values mean bigger differences.
  /// 0 means no random corners.
  final int randomRadius;

  /// If this is set, the component will repaint when the build method of the parent class is called.
  /// Since [BackgroundPaint] works with random values this should be false for the majority of the use cases.
  final bool repaint;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintObject = Paint();
    // create a bigger range to have double values
    int min = randomOffset * -100;
    int max = randomOffset * 100;
    int radiusMin = randomRadius * -100;
    int radiusMax = randomRadius * 100;
    // create the rounded rectangle to be drawn
    RRect innerRect = RRect.fromLTRBAndCorners(
      0 - randomNumber(min, max) / 100,
      0 - randomNumber(min, max) / 100,
      size.width - randomNumber(min, max) / 100,
      size.height - randomNumber(min, max) / 100,
      topLeft: Radius.elliptical(corners.topLeft.x - randomNumber(radiusMin, radiusMax) / 100,
          corners.topLeft.y - randomNumber(radiusMin, radiusMax) / 100),
      topRight: Radius.elliptical(corners.topRight.x - randomNumber(radiusMin, radiusMax) / 100,
          corners.topRight.y - randomNumber(radiusMin, radiusMax) / 100),
      bottomLeft: Radius.elliptical(corners.bottomLeft.x - randomNumber(radiusMin, radiusMax) / 100,
          corners.bottomLeft.y - randomNumber(radiusMin, radiusMax) / 100),
      bottomRight: Radius.elliptical(corners.bottomRight.x - randomNumber(radiusMin, radiusMax) / 100,
          corners.bottomRight.y - randomNumber(radiusMin, radiusMax) / 100),
    );
    // create the gradient shade filler
    paintObject.shader =
        gradient.createShader(Rect.fromLTRB(-size.width, -size.height, size.width * 2, size.height * 2));
    canvas.drawRRect(innerRect, paintObject);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => repaint;

  /// Takes a [min] and [max] value as range for the random generated number.
  /// This only works with [int] values, which is why the random numbers for the borders in this class
  /// get multiplied before being applied to the function, and divided afterwards.
  double randomNumber(int min, int max) {
    if (min == 0 && max == 0) return 0.0;
    var random = new Random();
    return (min + random.nextInt(max - min)).toDouble();
  }
}

class Corners {
  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;

  const Corners(this.topLeft, this.topRight, this.bottomLeft, this.bottomRight);

  Corners.all(double radius)
      : this.topLeft = Radius.circular(radius),
        this.topRight = Radius.circular(radius),
        this.bottomLeft = Radius.circular(radius),
        this.bottomRight = Radius.circular(radius);
}

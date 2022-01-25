import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// [ScribblePainter] serves as a [CustomPainter] for the [ScribbleBorder] class.
/// It will draw lines in a rectangle shape around the provided [Widget] in [ScribbleBorder].
/// It takes the size of a stroke [strokeWidth] and a [gradient] to determine its color.
/// [ScribbleBorder] uses random values to let the strokes appear to be drawn by a human with imperfect edges.
class ScribblePainter extends CustomPainter {
  ScribblePainter({
    required this.gradient,
    required this.randomOffset,
    required this.gradientStretch,
    required this.strokeWidth,
    required this.circular,
    required this.circularRadius,
    required this.repaint,
  });

  /// The gradient that should be used upon the strokes. This will always be linear for now and only takes the colors.
  final Gradient gradient;

  /// Value that determines how far strokes can overlap or how big the gaps can be.
  /// Bigger values mean bigger gaps and overlaps.
  /// 0.0 means no offset.
  final double randomOffset;

  /// Value that determines how far the gradient of a stroke is stretched out.
  /// Bigger values mean less strong gradient.
  /// 0.0 means default linear gradient with even distribution.
  final double gradientStretch;

  /// Size of the drawn lines.
  final double strokeWidth;

  /// If this is set the border will be drawn in a circle shape around the component.
  final bool circular;

  /// Sets a custom radius for the circle. (only does anything, if circular = true).
  /// The default will create a circle with half the width of the component as radius.
  final double circularRadius;

  /// If this is set, the component will repaint when the build method of the parent class is called.
  /// Since [ScribbleBorder] works with random values this should be false for the majority of the use cases.
  final bool repaint;

  @override
  void paint(Canvas canvas, Size size) {
    // create the visual appearance of the drawn lines
    Paint paintObject = Paint();
    paintObject.style = PaintingStyle.stroke;
    paintObject.strokeWidth = strokeWidth;
    // create a bigger range to have double values
    int offsetMin = -(randomOffset * 100).toInt();
    int offsetMax = (randomOffset * 100).toInt();
    int strokeMin = -(gradientStretch * 100).toInt();
    int strokeMax = (gradientStretch * 100).toInt();
    if (circular) {
      // points for gradient
      Offset p1 = Offset.zero;
      Offset p2 = Offset(size.width, size.height);
      // middle point
      Offset middle = Offset(size.width / 2 - randomNumber(offsetMin, offsetMax, true) / 100,
          size.height / 2 - randomNumber(offsetMin, offsetMax, true) / 100);
      // gradient shader
      paintObject.shader = ui.Gradient.linear(
          Offset(p1.dx * randomNumber(strokeMin, strokeMax, false) / 100,
              p1.dy * randomNumber(strokeMin, strokeMax, false) / 100),
          Offset(p2.dx * randomNumber(strokeMin, strokeMax, false) / 100,
              p2.dy * randomNumber(strokeMin, strokeMax, false) / 100),
          gradient.colors);
      // draw circle
      canvas.drawCircle(middle, circularRadius != 0.0 ? circularRadius : size.height / 2, paintObject);
    } else {
      // points of the rectangle
      Offset p1 = Offset.zero;
      Offset p2 = Offset(size.width, 0);
      Offset p3 = Offset(0, size.height);
      Offset p4 = Offset(size.width, size.height);
      // draw p1 -> p2
      paintObject.shader = ui.Gradient.linear(
          p1,
          Offset(p2.dx * randomNumber(strokeMin, strokeMax, false) / 100,
              p2.dy * randomNumber(strokeMin, strokeMax, false) / 100),
          gradient.colors);
      canvas.drawLine(
          Offset(p1.dx - randomNumber(offsetMin, offsetMax, true) / 100,
              p1.dy - randomNumber(offsetMin, offsetMax, true) / 100),
          Offset(p2.dx - randomNumber(offsetMin, offsetMax, true) / 100,
              p2.dy - randomNumber(offsetMin, offsetMax, true) / 100),
          paintObject);
      // draw p1 -> p3
      paintObject.shader = ui.Gradient.linear(
          p1,
          Offset(p3.dx * randomNumber(strokeMin, strokeMax, false) / 100,
              p3.dy * randomNumber(strokeMin, strokeMax, false) / 100),
          gradient.colors);
      canvas.drawLine(
          Offset(p1.dx - randomNumber(offsetMin, offsetMax, true) / 100,
              p1.dy - randomNumber(offsetMin, offsetMax, true) / 100),
          Offset(p3.dx - randomNumber(offsetMin, offsetMax, true) / 100,
              p3.dy - randomNumber(offsetMin, offsetMax, true) / 100),
          paintObject);
      // draw p2 -> p4
      paintObject.shader = ui.Gradient.linear(
          p2,
          Offset(p4.dx * randomNumber(strokeMin, strokeMax, false) / 100,
              p4.dy * randomNumber(strokeMin, strokeMax, false) / 100),
          gradient.colors);
      canvas.drawLine(
          Offset(p2.dx - randomNumber(offsetMin, offsetMax, true) / 100,
              p2.dy - randomNumber(offsetMin, offsetMax, true) / 100),
          Offset(p4.dx - randomNumber(offsetMin, offsetMax, true) / 100,
              p4.dy - randomNumber(offsetMin, offsetMax, true) / 100),
          paintObject);
      // draw p3 -> p4
      paintObject.shader = ui.Gradient.linear(
          p3,
          Offset(p4.dx * randomNumber(strokeMin, strokeMax, false) / 100,
              p4.dy * randomNumber(strokeMin, strokeMax, false) / 100),
          gradient.colors);
      canvas.drawLine(
          Offset(p3.dx - randomNumber(offsetMin, offsetMax, true) / 100,
              p3.dy - randomNumber(offsetMin, offsetMax, true) / 100),
          Offset(p4.dx - randomNumber(offsetMin, offsetMax, true) / 100,
              p4.dy - randomNumber(offsetMin, offsetMax, true) / 100),
          paintObject);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => repaint;

  /// Takes a [min] and [max] value as range for the random generated number.
  /// This only works with [int] values, which is why the random numbers for the borders in this class
  /// get multiplied before being applied to the function, and divided afterwards.
  double randomNumber(int min, int max, bool offset) {
    if (min == 0 && max == 0) return offset ? 0.0 : 100;
    var random = new Random();
    return (min + random.nextInt(max - min)).toDouble();
  }
}

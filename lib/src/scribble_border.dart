import 'package:flutter/material.dart';
import 'package:scribble_border/src/scribble_painter.dart';

/// [ScribbleBorder] uses the [ScribblePainter] classes [CustomPainter] to create a visual border effect around a provided [Widget].
/// The aim of this border is to look like a user has drawn a rectangle shape around the provided [child].
/// Since this is not a real [Border] it can be used around every visual [Widget].
class ScribbleBorder extends StatelessWidget {
  ScribbleBorder(
      {Key? key,
      required this.child,
      this.gradient = const LinearGradient(colors: [Colors.black26, Colors.black12]),
      this.padding = 0,
      this.randomOffset = 0.0,
      this.gradientStretch = 0.5,
      this.strokeWidth = 3,
      this.circular = false,
      this.repaint = false,
      this.circularRadius = 0.0})
      : painter = ScribblePainter(
          gradient: gradient,
          strokeWidth: strokeWidth,
          randomOffset: randomOffset,
          gradientStretch: gradientStretch,
          circular: circular,
          circularRadius: circularRadius,
          repaint: repaint,
        ),
        super(key: key);

  /// Child to be surrounded by the [ScribbleBorder].
  final Widget child;

  /// The gradient is used for the color-range of a stroke and is always linear for now.
  final Gradient gradient;

  /// Padding for the [Container] that surrounds the [child]..
  final double padding;

  /// Value that determines how far strokes can overlap or how big the gaps can be.
  /// Bigger values mean bigger gaps and overlaps.
  /// 0.0 means no offset.
  final double randomOffset;

  /// Value that determines how far the gradient of a stroke is stretched out.
  /// Bigger values mean less strong gradient. Always from the first color provided in the gradient to the second one.
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

  /// Our custom paint to be applied on the border.
  final ScribblePainter painter;

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

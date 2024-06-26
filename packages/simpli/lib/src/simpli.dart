import 'dart:math';

import 'package:simpli/src/data/rdp_simplifier.dart';
import 'package:simpli/src/data/visvalingam_simplifier.dart';

/// {@template simpli}
/// Line simplification algorithms, made simple! Sporting Ramer-Douglas-Peucker
/// and Visvalingam
/// {@endtemplate}
abstract class Simpli {
  /// {@macro simpli}
  const Simpli._();

  /// Simplifies a list of points using the Ramer-Douglas-Peucker algorithm
  /// using the given [pixelTolerance].
  static List<Point> ramerDouglasPeucker(
    List<Point> points, {
    double pixelTolerance = 50.0,
  }) {
    return const RdpSimplifier()
        .simplify(points, pixelTolerance: pixelTolerance);
  }

  /// Simplifies a list of points using the Visvalingam algorithm
  /// using the given [pixelTolerance].
  static List<Point<num>> visvalingam(
    List<Point<num>> points, {
    double pixelTolerance = 50.0,
  }) {
    return const VisvalingamSimplifier()
        .simplify(points, pixelTolerance: pixelTolerance);
  }
}

import 'dart:math';

import 'package:simpli/src/data/utils.dart';
import 'package:simpli/src/domain/simplifier.dart';

/// {@template rdp_simplifier}
/// A simplifier that uses the Ramer-Douglas-Peucker algorithm to simplify a
/// list of points.
/// {@endtemplate}
class RdpSimplifier implements Simplifier {
  /// {@macro rdp_simplifier}
  const RdpSimplifier();

  @override
  List<Point<num>> simplify(
    List<Point<num>> points, {
    double pixelTolerance = 50.0,
  }) {
    if (points.length < 3) {
      return points;
    }
    var maxDistance = 0.0;
    var index = 0;
    for (var i = 1; i < points.length - 1; i++) {
      final distance = Utils.perpendicularDistance(
        point: points[i],
        lineStart: points.first,
        lineEnd: points.last,
      );
      if (distance > maxDistance) {
        maxDistance = distance;
        index = i;
      }
    }

    if (maxDistance <= pixelTolerance) return [points.first, points.last];

    final firstPart = simplify(
      points.sublist(0, index + 1),
      pixelTolerance: pixelTolerance,
    );
    final secondPart = simplify(
      points.sublist(index),
      pixelTolerance: pixelTolerance,
    );

    return [
      ...firstPart.sublist(0, firstPart.length - 1),
      points[index],
      ...secondPart.sublist(1),
    ];
  }
}

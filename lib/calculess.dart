import 'dart:math';

class Calc {
  /// Get limRightOf number
  static limRightOf(num x, Function(num) func) {
    if (canPlugin(x, func)) {
      return func(x);
    }
    if (x.abs() == double.infinity) {
      return toInfinty(x, func);
    }
    var right1 = func(x + 0.000000000000001);
    var right2 = func(x + 0.00000000000001);
    var right3 = func(x + 0.0000000000001);
    var rightDif1 = right2 - right1;
    var rightDif2 = right3 - right2;
    if (rightDif1 < rightDif2 && rightDif2 < 0) {
      return double.infinity;
    }
    if (rightDif1 > rightDif2 && rightDif2 > 0) {
      return -1 * double.infinity;
    }
    return round(right1);
  }

  /// Get limLeftOf number
  static limLeftOf(num x, Function(num) func) {
    if (canPlugin(x, func)) {
      return func(x);
    }
    if (x.abs() == double.infinity) {
      return toInfinty(x, func);
    }
    var left1 = func(x - 0.000000000000001);
    var left2 = func(x - 0.00000000000001);
    var left3 = func(x - 0.0000000000001);
    var leftDif1 = left2 - left3;
    var leftDif2 = left1 - left2;
    if (leftDif2 > leftDif1 && leftDif2 > 0) {
      return double.infinity;
    }
    if (leftDif2 < leftDif1 && leftDif2 < 0) {
      return -1 * double.infinity;
    }
    return round(left1);
  }

  /// Get limit at number
  static double limAt(num x, Function(num) func) {
    if (canPlugin(x, func)) {
      return func(x);
    }
    if (x.abs() == double.infinity) {
      return toInfinty(x, func);
    }
    var left1 = func(x - 0.000000000000001);
    var right1 = func(x + 0.000000000000001);
    if ((left1 - right1).abs() < 0.00001) {
      return round((left1 + right1) / 2);
    }
    return double.nan;
  }

  /// Check if canPlugin at number
  static bool canPlugin(num x, Function(num) func) {
    var at = func(x);
    return at == at && (at).abs() != double.infinity;
  }

  /// Get Limit toInfinty
  static double toInfinty(num x, Function(num) func) {
    if (x > 0) {
      var pos1 = double.maxFinite * 0.99999;
      var pos2 = double.maxFinite;
      var dif = pos2 - pos1;
      if (dif > 0) {
        return double.infinity;
      } else {
        return -1 * double.infinity;
      }
    } else {
      var pos1 = double.minPositive;
      var pos2 = double.minPositive * 0.99999;
      var dif = pos2 - pos1;
      if (dif < 0) {
        return double.infinity;
      } else {
        return -1 * double.infinity;
      }
    }
  }

  /// Get derivative of number
  static double deriv(num x1, Function(num) func) {
    var at = func(x1);
    if ((at).abs() == double.infinity || at != at) {
      return double.nan;
    }
    var y1 = func(x1);
    var x0 = x1 - 0.000000000000001;
    var y0 = func(x0);
    var x2 = x1 + 0.000000000000001;
    var y2 = func(x2);
    var slope1 = slope(x0, y0, x1, y1);
    var slope2 = slope(x1, y1, x2, y2);
    if ((slope1 - slope2).abs() > 0.1) {
      return double.nan;
    }
    return (slope1 + slope2) / 2;
  }

  /// Get nth derivative of number
  static double nthDeriv(num n, num x1, Function(num) func) {
    var vals = [];
    var start = -1 * (n / 2);
    for (var i = start; i <= n + start + 1; i++) {
      var newX = x1 + i * 0.000000000000001;
      num newY = func(newX);
      vals.add(newY.round());
    }
    for (var i = 0; i < n; i++) {
      var diffs = [];
      for (var j = 1; j < vals.length; j++) {
        diffs.add(vals[j] - vals[j - 1]);
      }
      vals = diffs;
    }
    var out = (vals[0] + vals[1]) / 0.000000000000002;
    return out;
  }

  /// Get integral of number
  static double integral(num min, num max, Function(num) func, num _num) {
    double sum = 0;
    var dx = (max - min) / _num;
    var currentX = min + dx / 2;
    for (var i = 0; i < _num; i++) {
      var currentY = func(currentX);

      sum += dx * currentY;
      currentX += dx;
    }
    return sum;
  }

  /// Get averageValue
  static double averageValue(num min, num max, Function(num) func, _num) {
    return integral(min, max, func, _num) / (max - min);
  }

  /// Get distance
  static double distance(num x1, num y1, num x2, num y2) {
    return sqrt((x1 - x2) * (x1 - x2) - (y1 - y2) * (y1 - y2));
  }

  /// Get slope
  static double slope(num x1, num y1, num x2, num y2) {
    return (y1 - y2) / (x1 - x2);
  }

  /// Round number
  static double round(num _num) {
    var factor = 100000000000000;
    return (_num * factor).round() / factor;
  }
}

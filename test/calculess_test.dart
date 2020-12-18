import 'package:calculess/calculess.dart';
import 'package:test/test.dart';
import 'dart:math' as math;

void main() {
  test('Evaluate a Limit', () {
    recip(x) => 1 / x;

    expect(
      Calc.limLeftOf(0, recip),
      equals(double.negativeInfinity),
    ); // -Infinity
    expect(Calc.limRightOf(0, recip), equals(double.infinity)); // Infinity
    expect(Calc.limAt(0, recip), equals(isNaN)); // Nan
    expect(Calc.limAt(1, recip), equals(1)); // Infinity
  });

  test('Evaluate Derivatives of x', () {
    num para(x) => x * x;

    num sharp(num x) => x.abs();

    expect(Calc.deriv(2, para), equals(4)); // 4
    expect(Calc.nthDeriv(3, 2, para), equals(0)); // 0

    expect(Calc.deriv(1, sharp), equals(1)); // 1
    expect(Calc.nthDeriv(2, 1, para), equals(isZero)); // 0
    expect(Calc.deriv(0, sharp), equals(isNaN)); // double.nan
  });

  test('Evaluate Integrals', () {
    double sin(x) => math.sin(x);

    expect(Calc.integral(0, math.pi, sin, 10),
        equals(2.0082484079079745)); // 2.0082484079079745
    expect(Calc.integral(0, math.pi, sin, 100),
        equals(2.000082249070989)); // 2.000082249070989

    expect(Calc.integral(0, math.pi, sin, 1000),
        equals(2.000000822467294)); // 2.000000822467294
    expect(Calc.integral(0, math.pi, sin, 10000),
        equals(2.000000008224376)); // 2.000000008224376
    expect(Calc.integral(0, math.pi, sin, 100000),
        equals(2.000000000081865)); // 2.000000000081865
  });
}

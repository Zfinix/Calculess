import 'dart:math' as math;

import 'package:calculess/calculess.dart';

main(List<String> args) {
  sin(x) {
    return math.sin(x);
  }

  var t = [
    Calc.canPlugin(math.pi, sin), // 2.0082484079079745
    Calc.integral(0, math.pi, sin, 100), // 2.000082249070989
    Calc.integral(0, math.pi, sin, 1000), // 2.000000822467294
    Calc.integral(0, math.pi, sin, 10000), // 2.000000008224376
    Calc.integral(0, math.pi, sin, 100000) // 2.000000000081865
  ];

  t.forEach((e) => print(e));
}

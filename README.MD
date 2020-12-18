# Calculess.js
A Dart port for calculus library in dart and NPM. Originally Created by [Blake Sanie](https://github.com/blakesanie/Calculess/).


# Getting Started
Import and initialize package
```dart
import 'package:calculess/calculess.dart';
```

# Documentation
## Limits

Evaluate a limit
```dart
Calc.limAt( x , function );
```

Evaluate a limit from the left
```dart
Calc.limLeftOf( x , function );
```

Evaluate a limit from the right
```dart
Calc.limRightOf( x , function );
```
### Methods:
* Accept **±Infinity** as x value (parameter)
* Can output **±Infinity**
* Output **double.nan** when the *limit does not exist*

### Examples:

```dart
 recip(x) => 1 / x;


Calc.limLeftOf(0, recip); // -double.infinity
Calc.limRightOf(0, recip); // double.infinity
Calc.limAt(0, recip); // double.nan
Calc.limAt(1, recip); // 1
```
***
***

## Derivatives
<img src="https://www.wikihow.com/images/c/cc/Tangent_animation.gif" width="200px"></img>

Evaluate f'(x)
* Note: If the given function is not continuous or differentiable at the target, **double.nan** is returned
```dart
Calc.deriv( x , function );
```
Evaluate a derivative to the nth degree of x
* Note: as the degree increases, .nthDeriv() becomes **less accurate**. Also, continuity and differentiability are **not checked**.
```dart
Calc.nthDeriv( degree, x , function );
```

### Examples:

```dart
num para(x) => x * x;

Calc.deriv(2, para); // 4
Calc.nthDeriv(2, 2, para); // 2
Calc.nthDeriv(3, 2, para); // 0

num sharp(num x) => x.abs();

Calc.deriv(1, sharp); // 1
Calc.nthDeriv(2, 1, para); // 0
Calc.deriv(0, sharp); // double.nan
```
***
***
## Integrals
<img src="https://upload.wikimedia.org/wikipedia/commons/6/61/Riemann_sum_%28rightbox%29.gif" width="200px"></img>

Evaluate an integral using midpoint [Riemann Sums](https://en.wikipedia.org/wiki/Riemann_sum)
```dart
Calc.integral( start , end , function , numSubintervals );
```
Evaluate a function's average value
```dart
Calc.averageValue( start , end , function , numSubintervals );
```
Note: As the number of subintervals increases, .intregral() becomes more accurate, though more time is required for calculations
#### Examples
```dart
import 'dart:math' as math;

double sin(x) => math.sin(x);

Calc.integral(0, Math.PI, sin, 10); // 2.0082484079079745
Calc.integral(0, Math.PI, sin, 100); // 2.000082249070989
Calc.integral(0, Math.PI, sin, 1000); // 2.000000822467294
Calc.integral(0, Math.PI, sin, 10000); // 2.000000008224376
Calc.integral(0, Math.PI, sin, 100000); // 2.000000000081865
```
***
***
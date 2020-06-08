import 'auto_export.dart';

void main() {
  final sum = CalculatorSum();
  final sub = CalculatorSub();
  final mult = CalculatorMult();

  print("10 + 1 = ${sum.Sum(10, 1)}");
  print("10 - 1 = ${sub.Sub(10, 1)}");
  print("10 * 1 = ${mult.Mult(10, 1)}");
}

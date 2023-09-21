import 'package:meu_app_testes/meu_app_testes.dart';
import 'package:test/test.dart';

void main() {
  // funcao test
  test('calculate', () {
    expect(calculate(), 42); // espera que o method calculate() seja igual a 42
  });

    test('calculate', () {
    expect(calculate(), greaterThan(41)); // teste calculate expect que o method calculate() seja maior que 41
  });
}

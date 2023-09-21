import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  // funcao test
  test('Calcula o valor do produto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850); // espera-se que o method app.calcularDesconto() retorne 850, no caso de um desconto de 150 sobre 1000 sem porcentagem(false)
  });

    test('Calcula o valor do produto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), 850); // espera-se que o method app.calcularDesconto() retorne 850, no caso de um desconto de 15% sobre 1000 com porcentagem(true)
  });
}

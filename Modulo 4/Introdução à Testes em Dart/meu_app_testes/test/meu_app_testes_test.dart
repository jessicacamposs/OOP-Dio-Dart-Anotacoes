import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

// caso exista mais de um arquivo com testes e seja executado teste em todos, ira executar os testes em todos os arquivos criados com final test no nome (todos os arquivos para testes em dart deve ter "test" como nome no final)
// tambem podemos executar testes no terminal com: dart run test .\test\meu_app_testes_test.dart
void main() {
  // funcao test
  test('Calcula o valor do produto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850); // espera-se que o method app.calcularDesconto() retorne 850, no caso de um desconto de 150 sobre 1000 sem porcentagem(false)
  });

// Argument Exception Error(Erro causado por alguma excecao especifica que nao queremos que aconteca)
  test('Ira chamar um erro caso o valor do produto esteja zerado', () {
    expect(() => app.calcularDesconto(0, 150, false), throwsA(TypeMatcher<ArgumentError>())); // espera-se que quando o valor passado for zero, um erro sera exibido throwsA(TypeMatcher<ArgumentError>), fazendo o teste estar correto, caso seja avisado do erro
  });

    test('Calcula o valor do produto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850)); // espera-se que o method app.calcularDesconto() retorne 850, no caso de um desconto de 15% sobre 1000 com porcentagem(true)
  }); // tambem podemos usar o matcher equals(valor experado) para mostrar o valor exato esperado como resposta ao teste

// Argument Exception Error(Erro causado por alguma excecao especifica que nao queremos que aconteca)  
    test('Ira chamar um erro caso o valor do produto esteja sem desconto e com porcentagem(true)', () {
    expect(() => app.calcularDesconto(1000, 0, true), throwsA(TypeMatcher<ArgumentError>())); // espera-se que quando o valor passado para porcentagem for zero, um erro sera exibido throwsA(TypeMatcher<ArgumentError>), fazendo o teste estar correto, caso seja avisado do erro
  });
}

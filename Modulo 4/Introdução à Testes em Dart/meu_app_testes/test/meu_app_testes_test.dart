import 'dart:html';

import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

// caso exista mais de um arquivo com testes e seja executado teste em todos, ira executar os testes em todos os arquivos criados com final test no nome (todos os arquivos para testes em dart deve ter "test" como nome no final)
// tambem podemos executar testes no terminal com: dart run test .\test\meu_app_testes_test.dart
void main() {
  // funcao test
  test('Calcula o valor do produto com desconto e sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false),
        850); // espera-se que o method app.calcularDesconto() retorne 850, no caso de um desconto de 150 sobre 1000 sem porcentagem(false)
  });

// Argument Exception Error(Erro causado por alguma excecao especifica que nao queremos que aconteca)
  test('Ira chamar um erro caso o valor do produto esteja zerado', () {
    expect(
        () => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<
            ArgumentError>())); // espera-se que quando o valor passado for zero, um erro sera exibido throwsA(TypeMatcher<ArgumentError>), fazendo o teste estar correto, caso seja avisado do erro
  });

  test('Calcula o valor do produto com porcentagem(desconto)', () {
    expect(
        app.calcularDesconto(1000, 15, true),
        equals(
            850)); // espera-se que o method app.calcularDesconto() retorne 850, no caso de um desconto de 15% sobre 1000 com porcentagem(true)
  }); // tambem podemos usar o matcher equals(valor experado) para mostrar o valor exato esperado como resposta ao teste

// Argument Exception Error(Erro causado por alguma excecao especifica que nao queremos que aconteca)
  test(
      'Ira chamar um erro caso o valor do produto esteja sem desconto e com porcentagem(true)',
      () {
    expect(
        () => app.calcularDesconto(1000, 0, true),
        throwsA(TypeMatcher<
            ArgumentError>())); // espera-se que quando o valor passado para porcentagem for zero, um erro sera exibido throwsA(TypeMatcher<ArgumentError>), fazendo o teste estar correto, caso seja avisado do erro
  });

// grupo de testes, substituindo os testes anteriores e permitindo mais cases de test criados mais rapidos
// varios maps com os valores para situacoes de testes
// nomes de "desconto", "valor" e "percentual" devem ser identicos no group e dentro do double.parse para .toString
  group('Calcula o valor do produto com desconto: ', () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
    };

    // sempre colocar o expected dentro dos blocos de testes
    // o resultado sera concatenado a var valuesToTest, que recebera os valores para o teste
    valuesToTest.forEach((values, expected) {
      test('Valores de Entrada: $values Valor de saida Esperado: $expected', () {
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values['percentual'] == true),
            equals(expected)); // transformar os valores(double) para string (toString), para boolean(true), retornar boolean
      });
    });
  });

// tests para throw exception(errors)
// Argument Exception Error(Erro causado por alguma excecao especifica que nao queremos que aconteca)
// grupo de testes, substituindo os testes anteriores e permitindo mais cases de test criados mais rapidos
// varios maps com os valores para situacoes de testes
// nomes de "desconto", "valor" e "percentual" devem ser identicos no group e dentro do double.parse para .toString
// removido o expected, pois esperamos um erro e nao um resultado
  group('Calcula o valor do produto informando valores zerados, deve gerar erro ', () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true},
    };

    // sempre colocar o expected dentro dos blocos de testes
    // o resultado sera concatenado a var valuesToTest, que recebera os valores para o teste
    // mudamos o .forEach para For(in) loop, pois temos apenas um parametro agora e nao dois
    // nao esquecer () => no expected em tests de errors
    for (var values in valuesToTest) {
      test('Valores de Entrada: $values Valor de saida Esperado: Esperado Erro', () {
        expect(
          () =>  app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values['percentual'] == true),
            throwsA(TypeMatcher<
            ArgumentError>())); // transformar os valores(double) para string (toString), para boolean(true), retornar boolean
      });
    }
  });
}

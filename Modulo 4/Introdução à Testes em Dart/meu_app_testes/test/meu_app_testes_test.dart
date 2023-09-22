import 'dart:html';
import 'package:meu_app_testes/classes/viacep.dart';
import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meu_app_testes_test.mocks.dart';

// caso exista mais de um arquivo com testes e seja executado teste em todos, ira executar os testes em todos os arquivos criados com final test no nome (todos os arquivos para testes em dart deve ter "test" como nome no final)
// tambem podemos executar testes no terminal com: dart run test .\test\meu_app_testes_test.dart
@GenerateMocks([MockViaCEP]) // notation para gerar outras classes utilizando o command "dart run build_runner build --delete-conflicting-outputs"
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
      test('Valores de Entrada: $values Valor de saida Esperado: $expected',
          () {
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values['percentual'] == true),
            equals(
                expected)); // transformar os valores(double) para string (toString), para boolean(true), retornar boolean
      });
    });
  });

// tests para throw exception(errors)
// Argument Exception Error(Erro causado por alguma excecao especifica que nao queremos que aconteca)
// grupo de testes, substituindo os testes anteriores e permitindo mais cases de test criados mais rapidos
// varios maps com os valores para situacoes de testes
// nomes de "desconto", "valor" e "percentual" devem ser identicos no group e dentro do double.parse para .toString
// removido o expected, pois esperamos um erro e nao um resultado
  group(
      'Calcula o valor do produto informando valores zerados, deve gerar erro ',
      () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true},
    };

    // sempre colocar o expected dentro dos blocos de testes
    // o resultado sera concatenado a var valuesToTest, que recebera os valores para o teste
    // mudamos o .forEach para For(in) loop, pois temos apenas um parametro agora e nao dois
    // nao esquecer () => no expected em tests de errors
    for (var values in valuesToTest) {
      test('Valores de Entrada: $values Valor de saida Esperado: Esperado Erro',
          () {
        expect(
            () => app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values['percentual'] == true),
            throwsA(TypeMatcher<
                ArgumentError>())); // transformar os valores(double) para string (toString), para boolean(true), retornar boolean
      });
    }
  });

  test('Testar Conversao de String para UpperCase', () {
    expect(
        app.convertToUpper("dio"),
        equals(
            "DIO")); // espera-se que o method app.convertToUpper() retorne DIO
  });

  test('Testar Conversao de String para UpperCase 2', () {
    expect(
        app.convertToUpper("dio"),
        equalsIgnoringCase("dio")); // espera-se que o method app.convertToUpper() retorne DIO, porem, utilizando o equalsIgnoringCase no lugar do equals, ele ira ignorar o case informado e observara apenas as letras que formam a palavra para saber se sao iguais
  });

// usando a funcao criada retornarValor com o Double valor
    test('Valor maior que 50', () {
    expect(
        app.retornarValor(50),
        greaterThanOrEqualTo(50)); // espera-se que o method app.retornarValor(50) retorne um valor maior ou igual(greaterThanOrEqualTo) a (50)
  });

  test('Comeca com: D + convertToUpper ', () {
    expect(
        app.convertToUpper("dio"),
        startsWith("D")); // espera-se que o method app.convertToUpper() retorne DIO, porem, utilizando o startsWith() no lugar do equals, ele ira dizer se a string comeca com a letra informada
  });

  test('Valor maior que 50', () {
    expect(
        app.retornarValor(50),
        greaterThanOrEqualTo(50)); // espera-se que o method app.retornarValor(50) retorne um valor maior ou igual(greaterThanOrEqualTo) a (50)
  });

  test('Valor diferente do anunciado', () {
    expect(
        app.retornarValor(51),
        isNot(equals(50))); // espera-se que o method app.retornarValor(51) retorne um valor diferente(isNot()) a (50), tambem pode ser feito substituindo o equals por isNot
  });

  test('Retornar CEP', () async {
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    // map das informações que retornarao mock caso o cep passado seja esse
    // quando o teste for fidedigno ao mock, o mesno nao precisara entrar no viacep, pois ja possui o resultado
    // com o mock, conseguimos criar situacoes fidedignas a realidade de algum acesso ou parametro, quando nao possuimos ou podemos ter acesso a eles no momento
    when(mockMockViaCEP.retornarCep("01001000")).thenAnswer((realInvocation) => Future.value({
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "ibge": "3550308",
      "gia": "1004",
      "ddd": "11",
      "siafi": "7107"
  })); // deve retornar algo que deixaremos fixo
    
    var body = await mockMockViaCEP.retornarCep("01001000");
    expect(body["bairro"],(equals("Sé"))); // transformou o cep(String) em um Map
    expect(body["logradouro"], equals("Praça da Sé")); // pode-se ter varios expects no mesmo caso de test
  });
}

  // mockar um dado utilizando o mockito
  // precisa de uma Class intermediaria, para ela extend mock e implements via CEP
  // precisa implementar ViaCep para poder fazer o seu return Cep
  class MockViaCEP extends Mock implements ViaCep {
    
  }

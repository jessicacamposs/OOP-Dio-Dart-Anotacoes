import 'dart:convert';
import 'dart:io';

class ConsoleUtils {

  static String lerStringComTexto(String texto) {
    print(texto); // printar a string texto no console
    return lerStringConsole(); // retorna o method lerStringConsole()
  }

  // o dart nao permite o polimorfismo (sobrescrita) de methods, por seu modo dynamic

// shared among all instances of a class (static var) or specific to each instance (normal var)
  static String lerStringConsole() {
    return stdin.readLineSync(encoding: utf8) ?? ""; // retorna a leitura do input String do usuario
  }

// double static lerDouble aceita null 
// recebe a lerStringConsole e utiliza o method try and catch para testar erros
  static double? lerDouble() {
    var value = lerStringConsole();
    try {
      return double.parse(value); // tenta retornar o double como string, caso nao consiga, retorna nulo
    } catch (e) {
      return null;
    }
  }

// se o valor de saida for uma String, retornar nulo, senao, executar o try and catch
  static double? lerDoubleComTextoeComSaida(String texto ,String valorSaida) {
      do {
        try {
          var value = lerStringComTexto(texto);
          if (value == valorSaida) {
            return null;
          }
          return double.parse(value); // tenta retornar o double como string, caso nao consiga, retorna nulo
        } catch (e) {
          print(texto);
        }
      } while (true);
    }

  static double? lerDoubleComTexto(String texto) {
    print(texto);
    return lerDouble();
  }
}
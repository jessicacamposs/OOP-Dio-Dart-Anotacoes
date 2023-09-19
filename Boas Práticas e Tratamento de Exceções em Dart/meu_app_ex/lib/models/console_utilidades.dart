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
}
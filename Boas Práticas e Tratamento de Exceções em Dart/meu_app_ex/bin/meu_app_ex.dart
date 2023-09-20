import 'dart:convert';
import 'dart:io';

import 'package:meu_app_ex/meu_app_ex.dart' as meu_app_ex;

// ctrl + . para ver opcoes disponiveis quando necessaria uma acao da programadora
// parse é um método utilizado para converter uma representação de string em um valor numérico
// evitar colocar comentarios dentro de funcoes para nao causar erros
// executar utilizando o terminal para inserir valores
// lints para flutter ou dart, ajudam a identificar erros nos codigos, ja vem instalado por padrao o lints do dart

void main(List<String> arguments) {
  meu_app_ex.executar(); // chamando o method executar para assim que entrar no codigo, ir para o method executar

  /** -- 1 parte do codigo (nao usada mais)
   * print("Sistema de Notas: ");
  var line = stdin.readLineSync(encoding: utf8); // para ler o console do usuario

// try: tenta executar a acao sem erros
  try {double numero = double.parse(line ?? ""); // var double numero recebe a variavel line como uma string nao nula com ?? "" e passa ela como uma double com double.parse

      print(numero);    
  } catch (e) {
    // caso aconteca algum erro, executara a acao informada abaixo para o usuario
    print("$line nao e um numero valido!"); // vai ler o console do usuario (o primeiro print) // executar pelo terminal para poder digitar    
  } finally { 
    print("Executando o finally");
  } // o finally e executado independentemente se a aplicacao der erro ou nao
   **/ 
} 

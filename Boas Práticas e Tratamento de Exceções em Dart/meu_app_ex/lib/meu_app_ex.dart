// esta importando de meu_app_ex

import 'dart:convert';
import 'dart:io';

import 'package:meu_app_ex/models/aluno.dart';
import 'package:meu_app_ex/models/console_utilidades.dart';

void executar () {
  print("Bem-Vindo(a) ao Sistema de Notas!");
  
  // String para ler o nome do aluno digitado, apenas leitura
  //String nome = stdin.readLineSync(encoding: utf8) ?? ""; // importar stdin e dart convert // nao esquecer de colocar a conversao para nao nulo "??" e o vazio caso o usuario nao digite ""
  String nome = ConsoleUtils.lerStringComTexto("Digite o Nome do Aluno(A): "); // static methods permitem sua chamada sem precisarem ser instanciados 
  var aluno = Aluno(nome); // variavel aluno criada para chamar o construtor Aluno da class Aluno e receber o String nome digitado pelo usuario
}
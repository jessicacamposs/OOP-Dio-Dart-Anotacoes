// esta importando de meu_app_ex
// executar pelo terminal com dart run

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
  double? notas; // aceita nulo "?"
  // do(faca)...while(enquanto)
  do {
    notas = ConsoleUtils.lerDoubleComTextoeComSaida("DIGITE A NOTA OU 'S' PARA SAIR: ", "S");
    if (notas != null) {
      aluno.adicionarNotas(notas);
    }
  } while (notas != null);
  print("AS NOTAS DIGITADAS FORAM: ${aluno.getNotas()}");
  print("A MEDIA DO ALUNO FOI: ${aluno.retornarMedia()}"); // string interpolation
  if (aluno.aprovado(7)) {
    print("O ALUNO ${aluno.getNome()} FOI APROVADO COM MEDIA: ${aluno.retornarMedia()}");
  } else {
    print("O ALUNO FOI REPROVADO COM MEDIA ${aluno.retornarMedia()}");
  }
}
// boas praticas separar as outras class que nao a principal em um folder
// nao esquecer de importar as paginas e Class que fazem ligacao com essa utilizando o ctrl + .

import 'package:flutter/material.dart';
import 'package:trilhaapp/Services/gerador_de_numeros_aleatorios_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("chamando metodo build"); // utilizado no modo debug
    return Scaffold(
      appBar: AppBar(
        title: const Text ("Meu App", /* style: GoogleFonts.pacifico(),*/), // style: permite utilizar fontes importadas, como o GoogleFonts.fonteEscolhida
      ),body: Center(child: Text(numeroGerado.toString(), /*style: GoogleFonts.aDLaMDisplay(fontSize: 25),*/)), // fontSize: recebe o tamanho escolhido para a fonte
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // setState serve para colocar as variaveis que estarao em constante mutacao e ira atualizar a tela a medida que elas sofrerem atualizacoes
          setState(() {
            numeroGerado = GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000); // associando numeroGerado a Class GeradorNumeroAleatorioService e chamando seu method gerarNumeroAleatorio()
          // debugPrint(numeroGerado.toString()); // exibido toda vez que o metodo build for chamado para atualizar a pagina exibir as atualizacoes da variavel numeroGerado
          }); // gerarNumeroAleatorio() recebe obrigatoriamente o numero maximo que pode retornar como parametro, e ira gerar numeros dentro deste padrao
          print(numeroGerado); // mostra o numero que sera gerado e devera ser exibido na tela pelo widget Text
        }), // o FloatingActionButton precisa de um button(onPressed) e o onPressed precisa de uma funcao
    ); // Container() e um widget com varias propriedades que podem ser colocadas dentro do seu child:
  }
}
import 'dart:math';

import 'package:flutter/material.dart';

// precisamos de um void main() para rodar um aplicativo no dart e no flutter, porem, no flutter ele nao precisa obrigatoriamente de parametros(argumentos)
// para complementar o main(), tambem precisamos de um runApp(app) para rodar um aplicativo no flutter, no runApp(app) ele precisa de um constructor para passar um argumento, do tipo Widget sendo statelessWidget
// stateless widgets = constante / statefull widgets = mutaveis
// atalhos: stf for StatefulWidget, stl for StatelessWidget
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo), // para mudar a cor da AppBar
      debugShowCheckedModeBanner: false, // para retirar o debug banner
      home: const HomePage(),
    ); // o MaterialApp() exige um home: , sendo o home um Widget
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

  int _gerarNumeroAleatorio() {
    Random aleatorio = Random(); // cria uma variavel(aleatorio) da class Random para criar numeros Random()
    return aleatorio.nextInt(1000); // vai retornar um numero aleatorio gerado de 0 ate 1000
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("chamando metodo build"); // utilizado no modo debug
    return Scaffold(
      appBar: AppBar(
        title:  const Text ("Meu App"),
      ),body: Center(child: Text(numeroGerado.toString())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // setState serve para colocar as variaveis que estarao em constante mutacao e ira atualizar a tela a medida que elas sofrerem atualizacoes
          setState(() {
            numeroGerado = _gerarNumeroAleatorio(); // associando numeroGerado a _gerarNumeroAleatorio
          // debugPrint(numeroGerado.toString()); // exibido toda vez que o metodo build for chamado para atualizar a pagina exibir as atualizacoes da variavel numeroGerado
          });
          print(numeroGerado); // mostra o numero que sera gerado e devera ser exibido na tela pelo widget Text
        }), // o FloatingActionButton precisa de um button(onPressed) e o onPressed precisa de uma funcao
    ); // Container() e um widget com varias propriedades que podem ser colocadas dentro do seu child:
  }
}
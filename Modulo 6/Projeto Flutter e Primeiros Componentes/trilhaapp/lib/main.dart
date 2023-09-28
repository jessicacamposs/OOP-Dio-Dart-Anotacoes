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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ("Meu App"),
      ),
    ); // Container() e um widget com varias propriedades que podem ser colocadas dentro do seu child:
  }
}
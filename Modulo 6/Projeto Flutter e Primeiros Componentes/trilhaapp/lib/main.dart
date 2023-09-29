// boas praticas separar a class principal do aplicativo do main()
// nao esquecer de importar as paginas que fazem ligacao com essa utilizando o ctrl + .

import 'package:flutter/material.dart';
import 'my_app.dart';

// precisamos de um void main() para rodar um aplicativo no dart e no flutter, porem, no flutter ele nao precisa obrigatoriamente de parametros(argumentos)
// para complementar o main(), tambem precisamos de um runApp(app) para rodar um aplicativo no flutter, no runApp(app) ele precisa de um constructor para passar um argumento, do tipo Widget sendo statelessWidget
// stateless widgets = constante / statefull widgets = mutaveis
// atalhos: stf for StatefulWidget, stl for StatelessWidget
void main() {
  runApp(const MyApp());
}
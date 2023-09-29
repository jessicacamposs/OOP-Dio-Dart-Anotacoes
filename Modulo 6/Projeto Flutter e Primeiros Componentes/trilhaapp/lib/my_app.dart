// boas praticas separar a class principal do aplicativo do main()
// nao esquecer de importar as paginas que fazem ligacao com essa utilizando o ctrl + .

import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

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
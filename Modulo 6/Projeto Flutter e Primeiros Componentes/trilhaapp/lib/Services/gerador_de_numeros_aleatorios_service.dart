// method _gerarNumeroAleatorio() foi movida da home_page para o folder Services e criado uma pagina com uma Class para ele, possibilitando o uso do method privado em outras paginas
// boas praticas separar as outras class que nao a principal em um folder
// nao esquecer de importar as paginas que fazem ligacao com essa utilizando o ctrl + .

import 'dart:math';

class GeradorNumeroAleatorioService {

// o method _gerarNumeroAleatorio() deve se tornar publico e static para ser acessado por outras pages e classes
  static int gerarNumeroAleatorio(int numeroMaximo) {
    Random aleatorio = Random(); // cria uma variavel(aleatorio) da class Random para criar numeros Random()
    return aleatorio.nextInt(numeroMaximo); // var int numeroMaximo criada para receber o numero maximo que pode retornar
  }
}
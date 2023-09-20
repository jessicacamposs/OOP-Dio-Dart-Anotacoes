import 'dart:ffi';

class Aluno {
  String _nome = "";
  final List<double> _notas = []; // lista de doubles privada de nome notas, inicializada vazia, por ser final, nao pode ser inicializa outra lista nele

// construtor da class Aluno, recebendo apenas nome
  /*Aluno(String nome) {
    _nome = nome;
  }*/
  // pode ser resumido
  Aluno(this._nome); // quando for feito o construtor, sera bindado com esta variavel, estamos: a) Declarando um parâmetro _nome para o construtor. b) Atribuindo automaticamente o valor do parâmetro _nome ao membro _nome da classe.

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome(){
    return _nome;
  }

// getNotas do mesmo tipo da lista para pegar as notas, sem precisar do set, para nao criar uma lista nova
  List<double> getNotas() { 
    return _notas;
  }

// adiciona as notas da List para a variavel notas com o method add
  void adicionarNotas(double notas) {
    _notas.add(notas);
  }

  // funcao para retornar a media das notas
  double retornarMedia() {
    // var totalNotas = 0.0; // double var que ira receber as notas da list double
    var totalNotas = _notas.reduce((value, element) => value + element); // Esta linha utiliza o método reduce para somar todos os elementos presentes no array _notas e adiciona esse novo valor a variavel totalNotas, soma o valor anterior(value) + o novo elemento(element)
    /*for (var notas in _notas) {
      totalNotas = totalNotas + notas; // totalNotas vai receber os valores das notas e somar com seus valores(que sao nulos), precisa colocar totalNotas + notas, para que ele receba os valores, e nao que ele seja os valores
    // Ao usar totalNotas = totalNotas + notas, você está somando o valor atual de notas ao valor atual de totalNotas, mantendo o acumulado de todas as notas anteriores.
    }*/
    var media = totalNotas / _notas.length; // dividindo o total pelo tamanho para chegar na media
    return media.isNaN ? 0 : media;
  }

  bool aprovado(double notaCorte) {
    return retornarMedia() >= notaCorte;
  }
}
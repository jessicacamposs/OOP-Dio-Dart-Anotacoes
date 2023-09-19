import 'dart:ffi';

class Aluno {
  String _nome = "";
  final List<double> _notas = []; // lista de doubles privada de nome notas, inicializada vazia, por ser final, nao pode ser inicializa outra lista nele

// construtor da class Aluno, recebendo apenas nome
  Aluno(String nome) {
    _nome = nome;
  }

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
}
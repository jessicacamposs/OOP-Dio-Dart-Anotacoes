class NomeInvalidoException implements Exception {
  String erro() => "NOME INVALIDO!"; // cria um method String para enviar uma mensagem pela var erro, caso a class NomeInvalidoException seja chamada

  @override
  String toString() {
    return "NomeInvalidoException: ${erro()}";
  }
}
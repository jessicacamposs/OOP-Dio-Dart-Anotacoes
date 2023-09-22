import 'package:http/http.dart' as http;
import 'dart:convert';

// conectando a um server http para realizacao de chamadas e simulacao de testes
// precisa do pacote http (pub apt get http) & import 'package:http/http.dart' as http;
// viacep faz o retorno de chamadas para cep
// chamada asincrona, portanto, deve ser declarada como async
// chamadas async precisam de um Future 
class ViaCep {
Future<Map<dynamic, dynamic>> retornarCep(String cep) async {
  var uri = Uri.parse(
      "https://viacep.com.br/ws/$cep/json/"); // para chamar uma url, passar a url por um uri por ser String
  var retorno = await http.get(uri);
  var decodedResponse = jsonDecode(utf8.decode(retorno.bodyBytes))
      as Map; // convertendo o retorno String do http para um Map fazendo um jsonDecode
  print(decodedResponse);
  return decodedResponse; // retornar o corpo do method
}
}
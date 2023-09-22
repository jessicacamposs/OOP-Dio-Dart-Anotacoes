import 'dart:convert';

/*int calculate() {
  return 6 * 7; // funcao do teste calculate
} */

// funcao para dar descontos
double calcularDesconto(double valor, double desconto, bool percentual) {
  if (valor <= 0) {
  throw  ArgumentError("O valor do produto nao pode ser zero ou negativo!"); // ira acionar um erro caso o valor do produto seja negativo ou zero
  }
  if (desconto <= 0) {
    throw  ArgumentError("O valor do desconto nao pode ser zero ou negativo!"); // ira acionar um erro caso o valor do desconto seja negativo ou zero
  }
  if (percentual) {
    return valor - ((valor * desconto) / 100);
  }
  return valor - desconto;
}
 
 // method que retorna uma String em UpperCase
 String convertToUpper(String texto) {
  return texto.toUpperCase();
 }

 double retornarValor (double valor) {
  return valor;
 }
 
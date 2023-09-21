/*int calculate() {
  return 6 * 7; // funcao do teste calculate
} */

// funcao para dar descontos
double calcularDesconto(double valor, double desconto, bool percentual) {
  if (percentual) {
    return valor - ((valor * desconto) / 100);
  }
  return valor - desconto;
}
 
// Aqui eu confiro automaticamente se calculate continua devolvendo 42.
// Um teste ajuda a perceber quando uma mudança altera o resultado esperado.

// O primeiro import traz a função que quero testar. O segundo traz as
// ferramentas test e expect, usadas para organizar e conferir o teste.
import 'package:cli/cli.dart';
import 'package:test/test.dart';

// Ao executar dart test, esta função registra os testes deste arquivo.
void main() {
  // 'calculate' é o nome que aparece no relatório do teste.
  // () { ... } é uma função sem nome: passo esse trecho para test executar.
  test('calculate', () {
    // Primeiro calculate() faz a conta. Depois expect compara o resultado
    // com 42. Se os valores forem diferentes, o teste informa uma falha.
    expect(calculate(), 42);
  });
}

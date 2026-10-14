// Este arquivo guarda a primeira versão do executor de comandos.
// Por enquanto, ele só mostra a lista que recebeu, para eu entender como
// passar dados para um método e chamar esse método a partir de outro arquivo.

// CommandRunner é o molde do executor. Como não escrevi um construtor,
// posso usar CommandRunner() para criar um objeto sem passar informações.
class CommandRunner {
  /// run recebe os argumentos em input. O tipo `List<String>` significa
  /// uma lista de textos, como ['study', 'verbose'].
  ///
  /// async marca o método como assíncrono. Seu retorno, `Future<void>`,
  /// representa uma execução cuja conclusão posso aguardar com await.
  /// void indica que, ao terminar, ele não entrega um valor de resultado.
  /// Neste corpo, ainda não há uma tarefa demorada nem outra chamada com await.
  Future<void> run(List<String> input) async {
    // print escreve no terminal. $input insere a representação da lista
    // na mensagem, permitindo conferir quais argumentos chegaram ao método.
    print('CommandRunner received arguments: $input');
  }
}

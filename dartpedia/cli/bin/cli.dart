import 'dart:io';

import 'package:http/http.dart' as http;

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    // O comando wikipedia consulta o resumo de um artigo.
    // Passa os argumentos depois de wikipedia para a função de busca.
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs); // Inicia a busca; main não usa o resultado nem executa outra etapa depois dela.
  } else {
    printUsage(); // Mostra a ajuda quando o comando não é reconhecido.
  }
}

/*
articleTitle recebe o título do artigo e só pode ser atribuído uma vez, pois é final.
Se nenhum título vier nos argumentos, a função solicita a entrada pelo terminal.
Uma entrada nula ou vazia encerra a função. Caso existam argumentos, join(' ')
junta as palavras em uma única string para formar o título.
*/
void searchWikipedia(List<String>? arguments) async {
  // async permite usar await para aguardar a resposta da requisição.
  final String articleTitle;

  // Se o título não foi passado como argumento, solicita a entrada pelo terminal.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Lê a entrada para verificar se ela é nula ou está vazia.
    final inputFromStdin = stdin.readLineSync();
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return; // Encerra a função quando nenhum título é informado.
    }
    articleTitle = inputFromStdin;
  } else {
    // Junta os argumentos em um único título, separando as palavras por espaços.
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');

  // Aguarda a resposta da função que consulta a API da Wikipédia.
  var articleContent = await getWikipediaArticle(articleTitle);
  print(
    articleContent,
  ); // Exibe o corpo da resposta; por enquanto, o JSON ainda não é tratado.
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Domínio da Wikipédia em inglês.
    '/api/rest_v1/page/summary/$articleTitle', // Caminho da API para obter o resumo do artigo.
  );
  final response = await http.get(
    url,
  ); // Faz a requisição HTTP e aguarda a resposta.

  if (response.statusCode == 200) {
    return response.body; // Retorna o corpo da resposta quando o status é 200.
  }

  // Retorna uma mensagem de erro quando o status da resposta não é 200.
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

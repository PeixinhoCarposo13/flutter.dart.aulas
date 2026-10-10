import 'dart:io';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'",
  );
}

/*
Declara uma final String articleTitle variável. Isso permite que a análise estática detecte 
que ela articleTitle será um valor String e não será nula.
Em seguida, uma if/else instrução verifica se os argumentos da linha de comando para a pesquisa 
foram fornecidos.
Caso faltem argumentos, o programa solicita informações ao usuário, lê a entrada usando `read` 
stdin.readLineSync() e lida de forma segura com os casos em que nenhuma entrada é fornecida.
Caso existam argumentos , ele arguments.join(' ') os combina em uma única string de busca.
*/
void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into a single string.
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}

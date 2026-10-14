// Aqui ficam as classes que descrevem as opções de um comando e guardam
// seus resultados. Por enquanto, eu preencho esses resultados manualmente;
// este arquivo ainda não transforma argumentos do terminal em opções.

// Um enum reúne escolhas com nomes definidos, evitando usar textos soltos.
// flag é uma opção de ligar/desligar, como verbose: true ou false.
// option é uma opção que recebe um valor, como output: 'file.txt'.
enum OptionType { flag, option }

// Uma classe funciona como um molde. Cada Option criada a partir desse
// molde guarda os dados de uma opção, como seu nome e seu texto de ajuda.
class Option {
  // Este é o construtor: ele recebe os dados para criar uma nova Option.
  // this.name é um atalho para guardar o primeiro argumento no campo name
  // do próprio objeto. Os outros this fazem o mesmo com seus campos.
  //
  // name vem antes das chaves, então eu o passo pela posição: Option('verbose',
  // type: OptionType.flag). Dentro das chaves, passo os argumentos pelo nome.
  // required significa que preciso informar type ao criar o objeto.
  // Os demais argumentos podem ser omitidos; nesse caso, ficam com null,
  // que representa a ausência de um valor.
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  // Os campos são os dados guardados dentro de cada objeto.
  // final impede que eu atribua outro valor a eles depois da criação.
  // name guarda um texto (String), como 'verbose'. type guarda uma das
  // escolhas do enum OptionType, como OptionType.flag.
  final String name;
  final OptionType type;

  // help guarda a explicação da opção; abbr guarda sua abreviação, como 'v'.
  // String? significa que posso guardar um texto ou null. Assim, não sou
  // obrigado a fornecer descrição e abreviação para toda opção.
  final String? help;
  final String? abbr;

  // defaultValue guarda um possível valor padrão. Object? aceita valores
  // de diferentes tipos, como texto ou bool, e também aceita null.
  // valueHelp guarda um texto para descrever o valor esperado pela opção.
  // Por enquanto, só guardo essas informações; o código não aplica o padrão
  // nem inclui valueHelp na ajuda automaticamente.
  final Object? defaultValue;
  final String? valueHelp;

  // Um getter permite obter um valor calculado como se fosse um campo.
  // Ao escrever minhaOpcao.usage, este código monta e devolve a ajuda.
  // String indica que o resultado será um texto.
  String get usage {
    // Primeiro verifico se a opção tem uma abreviação. != null quer dizer
    // que esse dado foi informado. Se foi, incluo as duas formas de uso.
    // $abbr, $name e $help inserem os valores desses campos no texto.
    if (abbr != null) {
      return '-$abbr,--$name: $help';
    }

    // Sem abreviação, mostro só o nome completo. return devolve esse texto
    // para quem acessou usage. Se help não foi informado, a interpolação
    // mostra 'null', pois ainda não há um tratamento especial para isso.
    return '--$name: $help';
  }
}

// ArgResults reúne informações de um comando e as opções que ele recebeu.
// Como não escrevi um construtor, o Dart fornece ArgResults() automaticamente.
// Com ele, crio um objeto cujos campos começam com os valores abaixo.
class ArgResults {
  // command pode guardar o nome do comando e commandArg, seu argumento.
  // String? permite que comecem sem valor (null). Como não uso final aqui,
  // posso preencher ou trocar esses dados depois de criar o objeto.
  String? command;
  String? commandArg;

  // Um Map guarda pares de chave e valor. Aqui, a chave é um objeto Option
  // e o valor é a entrada associada a ele: por exemplo, true para verbose.
  // Object? permite valores de tipos diferentes e também null.
  // {} cria o mapa vazio; eu adiciono as opções conforme preciso.
  Map<Option, Object?> options = {};

  // Este método responde se uma flag está ativada. Recebo seu nome como
  // texto e devolvo um bool, ou seja, true (sim) ou false (não).
  bool flag(String name) {
    // options.keys dá acesso às chaves do mapa, que são objetos Option.
    // where filtra essas opções: a função (option) => ... recebe cada uma
    // e só a mantém quando seu tipo é flag. A seta é uma forma curta de
    // escrever uma função que devolve o resultado de uma expressão.
    // O for percorre as flags selecionadas, uma por vez.
    for (var option in options.keys.where(
      (option) => option.type == OptionType.flag,
    )) {
      // Comparo o nome guardado na opção com o nome recebido pelo método.
      if (option.name == name) {
        // options[option] busca o valor associado a essa chave no mapa.
        // Como o mapa aceita vários tipos, as bool exige que esse valor
        // seja booleano. Ele não converte texto em bool: um valor de outro
        // tipo ou null causa um erro. Por isso, preciso preencher flags
        // com true ou false. return entrega o valor e encerra a busca.
        return options[option] as bool;
      }
    }
    // Se não encontrei a flag, considero que ela não está ativada.
    return false;
  }

  // Aqui quero saber apenas se uma opção existe, independentemente do valor.
  // A busca recebe o nome completo; a abreviação não é verificada neste método.
  bool hasOption(String name) {
    // any devolve true assim que alguma chave atende à comparação.
    // Se nenhuma opção tiver o nome recebido, o resultado será false.
    return options.keys.any((option) => option.name == name);
  }

  // Às vezes preciso da opção e de seu valor juntos. Um record agrupa esses
  // dois dados sem exigir uma nova classe. Os campos têm nomes: option
  // guarda a Option encontrada e input guarda seu valor, que pode ser null.
  ({Option option, Object? input}) getOption(String name) {
    // options.entries permite percorrer os pares completos do mapa:
    // entry.key é a Option e entry.value é o valor associado a ela.
    // firstWhere pega o primeiro par que atende à comparação. O || significa
    // 'ou': aceito tanto o nome completo quanto a abreviação recebida em name.
    // Se não existir uma opção correspondente, firstWhere lança StateError
    // em vez de devolver null. Quem usa este método precisa considerar isso.
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );

    // Devolvo um record com os dois dados da entrada encontrada.
    // Quem chama pode ler resultado.option e resultado.input separadamente.
    return (option: mapEntry.key, input: mapEntry.value);
  }
}

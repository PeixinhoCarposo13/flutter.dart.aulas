// Aqui eu testo as classes do pacote com situações pequenas e conhecidas.
// Assim, consigo conferir a ajuda, as consultas de opções e a saída do executor.

// Importo as classes que quero testar e as ferramentas para conferir resultados.
import 'package:command_runner/command_runner.dart';
import 'package:test/test.dart';

// dart test chama main para registrar os testes deste arquivo.
// group reúne testes relacionados. test dá um nome a cada verificação e
// recebe uma função sem nome, () { ... }, com o código que será executado.
void main() {
  group('Option', () {
    // Crio duas opções para comparar a ajuda com e sem a forma curta.
    test('usage com e sem abreviação', () {
      // verbose é uma flag com abreviação v. output recebe um valor e não
      // tem abreviação. Cada chamada a Option(...) cria um objeto separado.
      final verboseOption = Option(
        'verbose',
        type: OptionType.flag,
        abbr: 'v',
        help: 'Display extra logging information.',
      );
      final outputOption = Option(
        'output',
        type: OptionType.option,
        help: 'Output file.',
      );

      // expect compara o resultado do getter com o texto que espero receber.
      // A primeira ajuda deve ter -v e --verbose; a segunda, apenas --output.
      expect(
        verboseOption.usage,
        '-v,--verbose: Display extra logging information.',
      );
      expect(outputOption.usage, '--output: Output file.');
    });
  });

  group('ArgResults', () {
    // Preencho os resultados à mão, pois ainda não tenho um interpretador
    // de argumentos. Cada teste cria seus próprios objetos para não depender
    // das alterações feitas em outro teste.
    test('consulta flags e existência pelo nome completo', () {
      final verboseOption = Option('verbose', type: OptionType.flag, abbr: 'v');
      final outputOption = Option('output', type: OptionType.option);
      final results = ArgResults();

      // Neste mapa, verboseOption é a chave ligada ao valor true.
      // outputOption é outra chave, ligada ao texto 'file.txt'.
      results.options = {verboseOption: true, outputOption: 'file.txt'};

      // isTrue e isFalse conferem valores booleanos. verbose está ativada;
      // output não é uma flag, e missing nem existe, então ambas dão false.
      expect(results.flag('verbose'), isTrue);
      expect(results.flag('output'), isFalse);
      expect(results.flag('missing'), isFalse);

      // Troco o valor da flag no mapa e confiro se a consulta percebe isso.
      // final impede trocar o objeto results, mas não impede mudar seus dados.
      results.options[verboseOption] = false;
      expect(results.flag('verbose'), isFalse);

      // hasOption só verifica a existência pelo nome completo. Por isso,
      // encontra output, mas não reconhece v como abreviação de verbose.
      expect(results.hasOption('output'), isTrue);
      expect(results.hasOption('v'), isFalse);
      expect(results.hasOption('missing'), isFalse);
    });

    // getOption aceita também a abreviação e devolve os dados em um record.
    test('consulta record por nome e abreviação', () {
      final outputOption = Option('output', type: OptionType.option, abbr: 'o');
      final results = ArgResults();
      // null representa um valor não informado, mas a chave continua no mapa.
      results.options = {outputOption: null};

      // .option e .input acessam os campos do record devolvido por getOption.
      // same confere se recebi exatamente o objeto que coloquei no mapa;
      // isNull confere se a consulta pela abreviação preserva o valor ausente.
      expect(results.getOption('output').option, same(outputOption));
      expect(results.getOption('o').input, isNull);

      // Passo uma função para expect executar a busca e capturar seu erro.
      // throwsStateError confere o erro esperado para uma opção inexistente.
      expect(() => results.getOption('missing'), throwsStateError);
    });
  });

  // Este teste é async porque precisa aguardar a conclusão da verificação.
  test('CommandRunner exibe os argumentos recebidos', () async {
    // Crio o executor e passo uma função que chama run com a lista ['study'].
    final runner = CommandRunner();

    // prints captura o que a função escreve e compara com a mensagem esperada.
    // \n representa a quebra de linha que print acrescenta ao final do texto.
    // expectLater devolve um Future; await espera a verificação terminar
    // antes de considerar este teste concluído.
    await expectLater(
      () => runner.run(['study']),
      prints('CommandRunner received arguments: [study]\n'),
    );
  });
}

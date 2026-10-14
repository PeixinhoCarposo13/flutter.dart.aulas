// Este import traz as classes do meu pacote local, incluindo a classe Option.
import 'package:command_runner/command_runner.dart';

void main() {
  // Option é o molde; Option(...) cria um objeto com os dados que passo aqui.
  // Guardo esse objeto em verboseOption para consultar seus dados mais abaixo.
  // Com final, não posso trocar o objeto guardado nessa variável por outro.
  //
  // 'verbose' é o nome da opção e vem primeiro, sem escrever name: antes dele.
  // Os outros argumentos têm nomes, como type: e help:, para deixar claro
  // qual informação estou passando. type é obrigatório no construtor.
  // flag representa uma opção de ligar ou desligar, como true ou false.
  // abbr guarda a forma curta 'v', e help guarda o texto de ajuda.
  // Aqui eu só descrevo a opção; ainda não estou lendo argumentos do terminal.
  final verboseOption = Option(
    'verbose',
    type: OptionType.flag,
    abbr: 'v',
    help: 'Display extra logging information.',
  );

  // print escreve uma mensagem no terminal. Com ${...}, coloco o resultado
  // de uma expressão dentro do texto, em vez de escrever esse valor à mão.
  // verboseOption.name pega o nome que guardei no objeto: 'verbose'.
  print('Defined option: ${verboseOption.name}');

  // usage é um getter: eu o acesso como um campo, mas ele executa um trecho
  // de código para montar a ajuda. Neste caso, junta a abreviação, o nome
  // e a descrição: '-v,--verbose: Display extra logging information.'.
  print('Usage: ${verboseOption.usage}');
}

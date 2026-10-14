/// Este arquivo é a entrada pública do meu pacote: reúne as classes que
/// quero disponibilizar para outros arquivos, como o programa da CLI.
library;

// library declara esta unidade como uma biblioteca Dart. Neste caso,
// ela não tem um nome declarado nem precisa executar um programa próprio.
//
// export disponibiliza para quem importar este arquivo as classes dos
// arquivos abaixo. Assim, um único import de command_runner.dart dá acesso
// a Option, OptionType, ArgResults e CommandRunner.
export 'src/arguments.dart';
export 'src/command_runner_base.dart';

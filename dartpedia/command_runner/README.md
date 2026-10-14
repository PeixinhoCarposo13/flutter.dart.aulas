# Meu pacote command_runner

Criei este pacote local durante meus estudos de Dart. Parei na aula **Defina classes e objetos** e uso suas classes na [CLI](../cli/README.md).

## O que implementei até aqui

O [arquivo público](lib/command_runner.dart) exporta as definições de [argumentos](lib/src/arguments.dart) e o [executor inicial](lib/src/command_runner_base.dart).

- `OptionType` diferencia `flag` de `option`.
- `Option` guarda nome, tipo, ajuda, abreviação, valor padrão e descrição do valor. Seu construtor exige `name` e `type`; os outros campos são opcionais. O getter `usage` monta a ajuda com ou sem abreviação. Os metadados de valor padrão e descrição do valor apenas ficam armazenados nesta etapa.
- `ArgResults` guarda `command`, `commandArg` e um mapa de opções com seus valores. Preencho esses dados manualmente: ainda não há um interpretador de argumentos.
- `CommandRunner.run` recebe uma lista de textos e a imprime. Retorna `Future<void>` e pode ser aguardado com `await`.

Em `ArgResults`, `flag` procura pelo nome completo entre as flags, espera um valor booleano e retorna `false` quando não encontra a flag. `hasOption` também consulta somente o nome completo. `getOption` aceita nome ou abreviação e devolve um record com `option` e `input`; lança `StateError` quando não encontra a opção.

## Meu exemplo

O [exemplo executável](example/command_runner_example.dart) cria a opção `verbose` e mostra seu nome e sua ajuda, usando a classe atual `Option`.

Nesta pasta, com um SDK compatível com `^3.13.5`, executo:

```sh
dart pub get
dart run example/command_runner_example.dart
dart analyze
dart test
```

Nos [testes](test/command_runner_test.dart), confiro a ajuda com e sem abreviação, flags ativadas e desativadas, consultas por nome e abreviação, valores nulos, opções ausentes e a mensagem do executor.

Estou praticando classes, construtores, tipos anuláveis, enumerações, mapas, funções anônimas, getters e records. Mantenho `lints` e `test` como dependências de desenvolvimento. O `.gitignore` da raiz ignora os arquivos gerados e o `pubspec.lock` deste pacote de biblioteca; o lock da CLI permanece versionado.

Meu progresso geral está no [README principal](../../README.md), e guardo as [anotações das aulas](../../anotacoes/anotacoes.txt).

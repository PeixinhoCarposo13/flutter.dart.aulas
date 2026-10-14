# Minha CLI de estudo

Estou usando este projeto para praticar Dart no terminal. Parei na aula **Defina classes e objetos** e agora importo meu [pacote local command_runner](../command_runner/README.md).

## Código atual

No [programa principal](bin/cli.dart), crio uma `Option` chamada `verbose`, do tipo `OptionType.flag`, com a abreviação `v` e uma descrição. Leio o campo `name` e o getter `usage` para mostrar:

```text
Defined option: verbose
Usage: -v,--verbose: Display extra logging information.
```

Nesta etapa, meu programa não interpreta argumentos nem faz requisições à Wikipédia. Essas aulas anteriores estão registradas nas [minhas anotações](../../anotacoes/anotacoes.txt).

Também mantenho a função gerada [calculate](lib/cli.dart), que retorna `6 * 7`, e seu [teste](test/cli_test.dart), que espera `42`. Ela não é chamada pelo programa principal.

## Como executo e confiro

Nesta pasta, com um SDK compatível com `^3.13.5`:

```sh
dart pub get
dart run bin/cli.dart
dart analyze
dart test
```

Meu `pubspec.yaml` mantém `path`, `http` e a dependência local `command_runner`; o programa atual usa apenas esta última. Uso `lints` e `test` no desenvolvimento e mantenho `pubspec.lock` versionado para registrar a resolução das dependências.

Estou praticando criação de objetos, parâmetros nomeados, campos e getters. O [README principal](../../README.md) resume meu progresso.

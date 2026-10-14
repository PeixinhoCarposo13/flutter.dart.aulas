# Meus estudos de Dart e Flutter

Criei este repositório para guardar meus exercícios e anotações enquanto aprendo Dart e Flutter. Por enquanto, estou praticando Dart com programas de terminal.

## Onde parei

Parei na aula **Defina classes e objetos**. Estou criando o pacote local `command_runner` e usando a classe `Option` na CLI. Já estudei entrada de dados, argumentos, `Future`, `async`, `await` e requisições HTTP; minhas [anotações](anotacoes/anotacoes.txt) guardam esse percurso.

O programa atual cria a opção `verbose` e exibe seu nome e sua ajuda. Ele ainda não interpreta argumentos nem busca artigos da Wikipédia. O método `CommandRunner.run` apenas mostra a lista recebida.

## O que estou praticando

- Classes, objetos, construtores e parâmetros posicionais e nomeados.
- Campos `final`, tipos anuláveis, getters e a enumeração `OptionType`.
- Mapas e consultas com `where`, `any` e `firstWhere` em `ArgResults`.
- Records com campos nomeados e a interface pública de um pacote local.

## Arquivos de estudo

- [CLI](dartpedia/cli/README.md): meu programa principal e a função gerada `calculate`, com seu teste.
- [command_runner](dartpedia/command_runner/README.md): as classes atuais, um exemplo de `Option` e testes de ajuda, consultas e execução.
- [Programa principal](dartpedia/cli/bin/cli.dart).

## Como executo

Uso um SDK compatível com `^3.13.5`, como definido nos dois `pubspec.yaml`. A partir da raiz:

```sh
cd dartpedia/cli
dart pub get
dart run bin/cli.dart
```

A saída atual é:

```text
Defined option: verbose
Usage: -v,--verbose: Display extra logging information.
```

Para conferir cada pacote, entro em `dartpedia/cli` ou `dartpedia/command_runner` e executo:

```sh
dart pub get
dart analyze
dart test
```

## Materiais

Estou acompanhando a [documentação do Dart](https://dart.dev/) e a [documentação do Flutter](https://docs.flutter.dev/). Vou acrescentando exercícios conforme avanço nas aulas.

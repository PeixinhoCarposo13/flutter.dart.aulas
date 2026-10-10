# Meus estudos de Dart e Flutter

Criei este repositório para guardar as aulas, anotações e exercícios que estou fazendo enquanto aprendo Dart e Flutter. Por enquanto, estou começando pelos fundamentos de Dart e colocando em prática com um programa que roda no terminal.

## O que tem aqui

- [Minhas anotações de Dart](anotacoes/introducao_dart.md)
- [Dartpedia CLI](dartpedia/cli/README.md), o projeto que estou desenvolvendo nas aulas
- [Código principal do projeto](dartpedia/cli/bin/cli.dart)

## O que aprendi até agora

- Criar e executar um projeto Dart.
- Receber argumentos pelo terminal e trabalhar com listas.
- Colocar valores de variáveis dentro de strings.
- Usar `const` e `final`.
- Trabalhar com null safety e os operadores `?` e `??`.
- Ler o que o usuário digita usando `dart:io`.

## Sobre o Dartpedia CLI

É um programa de terminal com os comandos `help`, `version` e `search`. Estou usando ele para praticar os conceitos das aulas.

Por enquanto, a busca só recebe o título e mostra uma resposta de exemplo. Ainda não faz uma busca de verdade na Wikipédia.

## Como rodar

Você precisa ter o SDK do Dart instalado em uma versão compatível com o `pubspec.yaml` do projeto (`^3.13.5`). Depois, abra o terminal na pasta deste repositório e rode:

```sh
cd dartpedia/cli
dart pub get
dart run bin/cli.dart help
dart run bin/cli.dart version
dart run bin/cli.dart search Dart Programming
```

Se quiser digitar o título depois que o programa abrir, use:

```sh
dart run bin/cli.dart search
```

## Onde encontrar cada coisa

| Pasta | O que guardei nela |
| --- | --- |
| `anotacoes/` | Minhas anotações das aulas. |
| `dartpedia/cli/bin/` | O arquivo principal do programa. |
| `dartpedia/cli/lib/` | O código de exemplo que veio na criação do projeto. |
| `dartpedia/cli/test/` | O teste de exemplo que veio com o projeto. |

## Materiais que estou usando

- [Documentação do Dart](https://dart.dev/)
- [Documentação do Flutter](https://docs.flutter.dev/)

Vou adicionando novas anotações e exercícios conforme avanço nas aulas.

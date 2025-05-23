# Pokedex App

Este é um aplicativo **Pokédex** desenvolvido em **Flutter**. O app consome a [PokéAPI](https://pokeapi.co/) para listar mais de 1.300 Pokémons, exibir os detalhes e proporcionar uma experiência fluida.

---

## Tecnologias e versões utilizadas

- **Flutter**: 3.32.0 (Stable)
- **Dart**: 3.7.0
- **GoRouter**: v7.x — gerenciamento de rotas declarativo e tipado.
- **flutter_bloc / Bloc**: v9.x — state management (Cubit) para lógica de negócio reativa.
- **GetIt**: v8.x — service locator para injeção de dependências e inversão de controle.
- **Equatable**: v2.x — facilita comparações de estado sem boilerplate.
- **http_interceptor**: v1.x — adiciona interceptors (logging, tratamento de erros) às requisições HTTP.
- **http**: v0.13.x — cliente HTTP leve para consumo de APIs.

---
# Como Executar
1. Pré-requisitos:

    Flutter SDK 3.32.0.

    Android Studio ou VS Code configurados.

2. Clonar o repositório:

    git clone https://github.com/LeandroJSi/pokedex.git
    cd pokedex_app

3. Instalar dependências:

    flutter pub get

4.Rodar o aplicativo:

flutter run

## Principais Bibliotecas Utilizadas

- **flutter_bloc ^9.1.0**:	Gerenciamento de estado com Cubit para separar UI da lógica de negócio.
- **get_it ^8.3.0**: Service locator para injeção de dependências no estilo Clean Architecture.
- **equatable ^2.0.5**: Simplifica comparações de estado e implementações de props.
- **go_router ^9.0.1**: Roteamento declarativo, nomeado e com suporte a parâmetros e extras.
- **http ^0.13.5**: Cliente HTTP para consumo das rotas da api.
- **http_interceptor ^1.0.0**: Intercepta requisições/respostas para logging e tratamento global de erros.

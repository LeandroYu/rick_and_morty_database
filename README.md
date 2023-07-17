# rick_and_morty_database

Para esse projeto foi criado uma aplicação em Dart/Flutter.
O objetivo dessa aplicação é dispor dos dados obtidos da API do Rick e Morty(https://rickandmortyapi.com/). 

# Funções presentes no app: 
  * Visualizar na página inicial, uma lista de 20 personagens incialmente, contendo foto, nome e status, com o tamanho da paginação sendo dinamica, podendo ser selecionando, 5, 10 ou 20 itens por vez.
  * Clicar em um personagem da lista, para visualizar informações detalhadas. (seja criativo a api contem diversas informaçoes)
  *  Filtrar os personagens por nome, gênero, espécie e status, alguns filtros são enums, seja criativo.
  *  Combinar varios filtros.
  *  Acessar a lista de personagem offline.

# Packages
  * widgets:
    
    *flutter_staggered_grid_view: ^0.6.2 (https://pub.dev/packages/flutter_staggered_grid_view).

    *cached_network_image: ^3.2.3 (https://pub.dev/packages/cached_network_image).

    *loading_animation_widget: ^1.2.0+4 (https://pub.dev/packages/loading_animation_widget).

  * icons:
  
   *cupertino_icons: ^1.0.2 (https://pub.dev/packages/cupertino_icons)
   
   *font_awesome_flutter: ^10.5.0 (https://pub.dev/packages/font_awesome_flutter)

  * HTTP:
  
   *dio: ^5.2.1+1 (https://pub.dev/packages/dio)

  * Injection and state manager:
  
   *get_it: ^7.6.0 (https://pub.dev/packages/get_it)
   
   *mobx: ^2.2.0 (https://pub.dev/packages?q=mobx)
   
   *flutter_mobx: ^2.0.6+5 (https://pub.dev/packages/flutter_mobx)

  * router:

     *go_router: ^9.0.3 (https://pub.dev/packages/go_router)

  * local storage:
  
   *shared_preferences: ^2.2.0 (https://pub.dev/packages/shared_preferences)
  
   *sqflite: ^2.2.8+4 (https://pub.dev/packages/sqflite)

  * utils:

     *logger: ^1.4.0 (https://pub.dev/packages/logger)

     *path: ^1.8.3 (https://pub.dev/packages/path)

    *connectivity_plus: ^4.0.1 (https://pub.dev/packages/connectivity_plus)

  * dev_dependencies:
  
   *build_runner: ^2.4.6 (https://pub.dev/packages?q=build_runner)
  
   *mobx_codegen: ^2.3.0 (https://pub.dev/packages/mobx_codegen)

# Arquitetura
Para o projeto foi proposto uma arquitetura se basendo no Clean Architecture juntamente com Atomic Design.
As Paginas foram organizadas da seguinte maneira: 

<img width="300" height= "400" alt="Captura de Tela 2023-07-17 às 00 47 38" src="https://github.com/LeandroYu/rick_and_morty_database/assets/51834987/f53b50bf-aba3-44f5-a2d5-8d6e930e8594">

# Rodando o projeto
Para rodar o projeto deve seguir alguns passos:

1- no terminal utilizando o comando `cd` navegue até a pasta que deseja clonar o projeto.

2- clone o projeto utilizando o comando `git clone https://github.com/LeandroYu/rick_and_morty_database.git`.

3- abra o seu editor de código favorito (Android Studio, VsCode, etc.).

4- no terminal do editor de código utilize o comando `make reset` para limpar e gerar as dependencias necessarias.

5- execute o projeto.

# Makefile

Para maior praticidade durante o desenvolvimento do projeto foi criado um arquivo makefile para maior comodidade, contendo os seguintes comandos:

* `make reset` para limpar e reinstalar todas as dependencias do projeto.
* `make build_runner` para rodar o build_runner contendo o seguinte comando: `flutter pub run build_runner build --delete-conflicting-outputs`.
* `make build_runner_clean` para limpar o build_runner.
* `make clean` para limpar o projeto.

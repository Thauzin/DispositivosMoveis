import 'dart:io';

void main(){
  menu();
}

class Livro{
    String? nome;
    int ano; 
    String? genero;

    Livro(this.nome,this.ano,this.genero);

  void exibirlivro(){
    print("Livro: $nome Ano: $ano Gênero: $genero");
  }
    
}

List<Livro> livros = [];   

void adicionarlivro(){
  print("Nome do livro: ");
  String? nomeLivro = stdin.readLineSync();
  print("Ano do livro: ");
  String? anoLivroinput = stdin.readLineSync();
  print("Genero do livro: ");
  String? generoLivro = stdin.readLineSync();

  int anolivro = int.parse(anoLivroinput ?? '0');

  Livro livro1 = Livro(nomeLivro ,anolivro,generoLivro);

  livros.add(livro1);
}

void exibirlivros(){
  if (livros.isEmpty) {
    print("A lista está vazia");
  }
  else {
    for (var i = 0; i < livros.length; i++){
      stdout.write("${i}. ");
      livros[i].exibirlivro();
    }
  }
}

void removerlivro(){
  exibirlivros();
  print("Selecione o livro que quer remover: ");
  String? remover = stdin.readLineSync();
  int indiceremover = int.parse(remover ?? '');
  if (indiceremover == null || indiceremover > livros.length || indiceremover == ""){
    print("Indice não é válido, digite novamente: ");
    String? remover = stdin.readLineSync();
    int indiceremover = int.parse(remover ?? '');
    livros.remove(indiceremover);
  }
  else {
    livros.removeAt(indiceremover);
  }

}

void menu(){
  print("----------------------------");
  print("Bem vindo a Biblioteca! O que deseja fazer? \n 1 - Adicionar Livro\n 2 - Remover Livro \n 3 - Atualizar Livrvo \n 4 - Listar Livros \n 5 - Sair ");
  String? opcao = stdin.readLineSync();
  switch(opcao) {
    case "1":
    adicionarlivro();
    menu();
    break;

    case "2" :
    removerlivro();
    menu();
    break;

    case "3":
    print("Ainda não temos essa opção... Volte mais tarde");
    menu();
    break;

    case "4" : 
    exibirlivros();
    menu();
    break;

    case "5" :
    print("Espero que tenha gostado! Obrigada! ");

    default: 
    print("Opção inválida! Digite as opções disponiveis!");
    menu();
  }
}
import 'dart:io';

void main(){
  menu();
}

class Livro{
    String? nome;
    int? ano; 
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
  print("Livro Adicionado");
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
  if (livros.isEmpty){
    print("A Lista está vazia");
    menu();
  }
  exibirlivros();
  print("Selecione o livro que quer remover: ");
  String? remover = stdin.readLineSync();
  int indiceremover = int.parse(remover ?? "");
  if (indiceremover == null || indiceremover > livros.length || indiceremover == ""){
    print("Indice não é válido, digite novamente: ");
    removerlivro();
  }
  else {
    livros.removeAt(indiceremover);
    print("Livro removido!");
  }

}

void atualizarlivro(){
  if (livros.isEmpty){
    print("A Lista está vazia");
    menu();
  }
  exibirlivros();
  print("Digite o livro que você deseja atualizar");
  String? atualizar = stdin.readLineSync();
  int indiceatualizar = int.parse(atualizar ?? "");
  if (indiceatualizar == "" || indiceatualizar > livros.length){
      print("Indice não é valido, digite novamente");
  }
  else{
    print("Digite o nome atualizado ou enter para manter: ");
    String? novonome = stdin.readLineSync();
    print("Digite o ano atualizado ou enter para manter: ");
    String? novoano = stdin.readLineSync();
    int? anonovoint = int.tryParse(novoano ?? "");
    print("Digite o genero atualizado ou enter para manter: ");
    String? novogenero = stdin.readLineSync();

    if (novonome != null && novonome.isNotEmpty){
      livros[indiceatualizar].nome = novonome;
    }

     if (anonovoint != null || anonovoint != ""){
      livros[indiceatualizar].ano = anonovoint;
    }

     if (novogenero != null && novogenero.isNotEmpty){
      livros[indiceatualizar].genero = novogenero; 
    }

    print("Livro atualizado! ");
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
    atualizarlivro();
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
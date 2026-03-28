import 'dart:io';

void main(){


  adicionarlivro();
  exibirlivros();
  adicionarlivro();
  removerlivro();
  exibirlivros();
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

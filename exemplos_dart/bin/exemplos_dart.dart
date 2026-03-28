// import 'package:exemplos_dart/exemplos_dart.dart' as exemplos_dart;

void main() {
  print('Hello world: ');

  int qtdeProdutos = 10;
  double precoProduto = 19.99;
  String nome = "Teclado";
  bool emEstoque = true;
  var categoria = "Tech";

  print('int: $qtdeProdutos');
  print('double: $precoProduto');
  print('boolean: $emEstoque');
  print('vari: $categoria');
  print('String: $nome');

}

class Produto{
  String nome;
  double preco;
  String categoria;

  Produto(this.nome,this.categoria, this.preco);

  void exibirproduto(){
  print('Produto: $nome' );
  }
}



void exemploclass(){
  Produto produto1 = Produto("Xbox", "Tech", 4500);
  produto1.exibirproduto(); 
}







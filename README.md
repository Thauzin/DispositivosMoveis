# 📱 **Dispositivos Móveis** 

## 📌 Como acessar as atividades? ##
Para as atividades 1 e 2 acesse: exemplos_dart/bin/[nome da atividade] <br>
Para rodar as atividades 1 e 2 digite no terminal: dart bin/[nome da atividade].dart <br>
Para as atividades 3 e 4 acesse: exemplos_dart/lib/[nome da atividade] <br>
Para rodar as atividades 3 e 4 digite no terminal: flutter run -t lib/[nome da atividade].dart <br>
Obs: O nome da atividade está identificado na descrição das atividades. 

## 📝 Atividade 1 
Acesse o código "exemplos.dart" <br>
A primeira atividade foi para conhecer um pouco da linguagem dart. <br>
Nessa atividade utilizamos comandos básicos como: imprimir na tela, 
declarar os diferentes tipos de dados (int, double, String, etc) e por fim criar uma classe. 

## 📝 Atividade 2
Acesse o código "ativ2.dart" <br>
Nessa atividade criei o CRUD (Create, Read, Update e Delete). <br>
Foi criado uma classe principal livro com três atributos (nome, ano e genero) e uma lista para guardar esses livros. <br>
Quando o programa inicia ele chama um Menu para o usuário escolher entre quatro funcionalidades: <br>
**1 - Adicionar Livros:** Foi criado um método para adicionar livros na lista de acordo com os atríbutos da classe Livro. <br>
**2 - Remover Livros:** Foi criado um método onde mostra os livros da lista e o ysyário escolhee algum para remover <br>
**3 - Atualizar Livros:** Foi criado um método onde mostra os livros da lista e o usuário escolhe qual livro e atríbuto quer modificar <br>
**4 - Exibir Livros:** Foi criado um método para mostrar os livros que estão na lista. <br>
Além dessas funcionalidades o menu da uma opção de sair que finaliza o programa e faz uma tratativa caso o usuário digite uma funcionalidade que não existe.

## 📝 Atividade 3
Acesse o código "calculadora.dart" <br>
O objetivo dessa atividade foi criar uma calculadora funcional utilizando o Flutter como interface. <br>
Usei widgets como: <br>
**MaterialApp:** Widget raiz <br>
**Column e Row:** Para organizar os números verticalmente e horizontalmente. <br>
**Text:** Para exibir os números, o total e demais textos na tela. <br>
**ElevatedButton:** Os botões dos números. <br>
Para lógica da minha calculadora criei 3 métodos: <br>
**1 - Atribuir:** Esse método organiza os números 1 e 2 da nossa calculadora, onde, o número 1 é capturado quando o a operação ainda não foi clicada e o número 2 é capturado após a operação ser clicada e antes do cálculo total.  
**2 - caloperacao:** Esse método registra qual operação matemática o usuário clicou. <br>
**3 - caltotal:** Esse método é acionado após o usuário clicar no "=", o método calcula os números 1 e 2 digitados pelo usuário e a operação desejada, mostrando o total na tela.  



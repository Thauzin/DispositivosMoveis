import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp()); 
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'App Flutter',

      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
        style : ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 7, 243, 125),
          minimumSize: Size(double.infinity, 60),
        )),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 214, 10, 163)),
        useMaterial3: true,
      ),

      home: const PaginaCalculadora(), 
    );
  }
}


class PaginaCalculadora extends StatefulWidget {
  const PaginaCalculadora({super.key});

  @override
  State<PaginaCalculadora> createState() => _PaginaCalculadoraState();
}

class _PaginaCalculadoraState extends State<PaginaCalculadora> {
  String numero1 = "";
  String numero2 = "";
  String operacao = "";
  double total = 0;
  bool foicalculado = false;


  void atribuir(valor){
    setState(() {
      if(operacao == ""){
        numero1 = numero1 + valor;
      }
      else if (foicalculado == false){
        numero2 = numero2 + valor;
      }
    });
  }

  void calcoperacao(operacaoreturn){
    if (numero1 == ""){
      operacao = "";
    }
    else{
      setState(() {
      operacao = operacaoreturn;
    });
    }
  }

  void caltotal(){

    if (numero2 == ""){
      foicalculado = false;
    }

    else{
    setState(() {
      foicalculado = true;
        switch (operacao) {
      case "+":
      double num1 = double.parse(numero1);
      double num2 = double.parse(numero2);
      total = num1 + num2;
      break;
      case "-":
      double num1 = double.parse(numero1);
      double num2 = double.parse(numero2);
      total = num1 - num2;
      break;
      case "*":
      double num1 = double.parse(numero1);
      double num2 = double.parse(numero2);
      total = num1 * num2;
      break;
      case "/":
      double num1 = double.parse(numero1);
      double num2 = double.parse(numero2);
      total = num1 * num2;
      break;
          }
    });
    }
  }

  void excluir(){
    foicalculado = false;
    setState(() {
      numero1 = "";
      numero2 = "";
      operacao = "";
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Calculadora da Thauzin'),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          // Permite rolagem

          padding: const EdgeInsets.all(16),

          child: Column(
            // Layout vertical
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // =====================
              // VALOR DINÂMICO
              // =====================
              Text(
                'Total: $total',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 16),

              // =====================
              // LINHA COM CAIXAS
              // =====================
              Row(
                children: [
                  // CAIXA 1
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text('Número 1\n$numero1',
                          textAlign: TextAlign.center),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // CAIXA 2
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text('Operação\n$operacao',
                          textAlign: TextAlign.center),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // CAIXA 3
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text('Número 2\n$numero2',
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // =====================
              // BOTÕES
              // =====================
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("1"),
                      child: const Text('1'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("2"),
                      child: const Text('2'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("3"),
                      child: const Text('3'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("4"),
                      child: const Text('4'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("5"),
                      child: const Text('5'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("6"),
                      child: const Text('6'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("7"),
                      child: const Text('7'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("8"),
                      child: const Text('8'),
                    ),
                  ),
                ],
              ),
                const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("9"),
                      child: const Text('9'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> atribuir("0"),
                      child: const Text('0'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                       onPressed: ()=> calcoperacao("+"),
                      child: const Text('+'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> calcoperacao("-"),
                      child: const Text('-'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> calcoperacao("*"),
                      child: const Text('*'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> calcoperacao("/"),
                      child: const Text('/'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> excluir(),
                      child: const Text('C'),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> caltotal(),
                      child: const Text('='),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomCard extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final Color corFundo;

  const CustomCard({
    super.key,
    required this.titulo,
    required this.icone,
    required this.corFundo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          Icon(icone, size: 28),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
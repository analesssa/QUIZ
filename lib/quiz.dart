import 'package:flutter/material.dart';

class PaginaQuiz extends StatefulWidget {
  @override
  _PaginaQuizState createState() => _PaginaQuizState();
}

class _PaginaQuizState extends State<PaginaQuiz> {
  int indicePergunta = 0;
  Map<String, int> pontuacoes = {}; // Armazenar pontuações por opção

  List<Map<String, dynamic>> perguntas = [

        {
        'asset':'lib/assets/gatito.jpg',
        'texto': 'O que significa a expressão "out of the blue"?',
        'opcoes': {
          
          'Bem devagarinho': 0,
          'Do nada': 1,
          'No céu claro': 0,
          'Com muito barulho': 0,
        },
      },
        {

        'asset':'lib/assets/gatito2.jpg',
        'texto': 'O que significa a expressão "in a jiffy"?',
        'opcoes': {

          'Em um tempão': 0,
          'De um jeito bem complicado': 0,
          'Devagarinho': 0,
          'Vapt Vupt': 1,
        },
      },
          {
        'asset':'lib/assets/gatito3.jpg',
        'texto': 'O que significa a palavra "cuckold"?',
        'opcoes': {

          'Homem rico': 0,
          'Preguiçoso': 0,
          'Corno': 1,
          'Homem folgado': 0,
        },
      },
          {
        'asset':'lib/assets/gatito4.jpg',    
        'texto': 'O que significa a expressão "gotta bail"?',
        'opcoes': {

          'Vou vazar': 1,
          'Cancelar o rolê': 0,
          'Ir pra cadeia': 0,
          'Tomar uma decisão rápida': 0,
        },
      },
        {

        'asset':'lib/assets/gatito5.jpg',  
        'texto': 'O que significa a palavra "hellhole"?',
        'opcoes': {

          'Lar doce lar': 0,
          'Muquifo': 1,
          'Centro da cidade': 0,
          'Uma caverna': 0,
        },
      },
        {

        'asset':'lib/assets/gatito6.jpg',  
        'texto': 'O que significa a expressão "walk on eggshells"?',
        'opcoes': {
    
          'Andar descalço': 0,
          'Pisar em ovos': 1,
          'Bater perna': 0,
          'Agir errado': 0,
        },
      },
          {

        'asset':'lib/assets/gatito7.jpg',    
        'texto': 'O que significa a expressão "Bullshit"?',
        'opcoes': {

          'Papo furado': 1,
          'Saco cheio': 0,
          'Bala': 0,
          'Bagunça': 0,
        },
      },
          {

        'asset':'lib/assets/gatito8.jpg',
        'texto': 'O que significa a expressão "Kiss ass" ?',
        'opcoes': {
          
          'Cara de pau ': 0,
          'Mentiroso': 0,
          'Puxa saco': 1,
          'Esquisito': 0,
        },
      },
          {

        'asset':'lib/assets/gatito9.jpg',
        'texto': 'O que quer dizer "white lie"?',
        'opcoes': {

          'Carta branca': 0,
          'Mantra': 0,
          'Marca de sabão': 0,
          'Mentirinha': 1,

        },
      },
          {

        'asset':'lib/assets/gatito10.jpg',
        'texto': 'Qual significado da expressão "Whinning"?',
        'opcoes': {

          'Enganar alguém': 0,
          'Fazer mimimi': 1,
          'Ganhar algo': 0,
          'Passar a perna em alguém': 0,
        },
      },
      ];

  void responder(String opcaoSelecionada) {
    // Adiciona ou atualiza a pontuação da opção selecionada
    pontuacoes[opcaoSelecionada] =
        perguntas[indicePergunta]['opcoes'][opcaoSelecionada];

    if (indicePergunta + 1 < perguntas.length) {
      setState(() {
        indicePergunta++;
      });
    } else {
      // Mostra o resultado final
      mostrarResultados();
    }
  }

  void mostrarResultados() {
    String resultado = 'Resultados:\n';
    int pontuacaoFinal = 0;
    pontuacoes.forEach((opcao, score) {
      resultado += '$opcao: ${score == 1 ? "Correto" : "Incorreto"}\n';
      pontuacaoFinal += score;
    });
    resultado += '\nPontuação final: $pontuacaoFinal/${perguntas.length}';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Resultado'),
        content: Text(resultado),
        actions: [
          TextButton(
            child: Text('Fechar'),
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                indicePergunta = 0; // Reiniciar o quiz
                pontuacoes.clear(); // Limpar as pontuações
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: SingleChildScrollView(
          // Permite rolagem do conteúdo
          child: Center(
        child: Column(
          children: [
            // Usando a URL para a imagem
            Image.asset(
              perguntas[indicePergunta]['asset'] as String,
              fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width *
                  0.9, // Ajusta a largura da imagem
              height: MediaQuery.of(context).size.height *
                  0.4, // Ajusta a altura da imagem
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                perguntas[indicePergunta]['texto'],
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, // Ajusta o alinhamento do texto
              ),
            ),
            ...perguntas[indicePergunta]['opcoes'].keys.map((opcao) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () => responder(opcao),
                  child: Text(opcao),
                ),
              );
            }).toList(),
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/resultado.dart';  

class PaginaQuiz extends StatefulWidget {
  @override
  _PaginaQuizState createState() => _PaginaQuizState();
}

class _PaginaQuizState extends State<PaginaQuiz> {
  int indicePergunta = 0;
  List<double> escalasBotao = [];  // Lista para controlar a escala de cada botão
  Map<String, int> pontuacoes = {  // Pontuação por temperamento
    'sanguineo': 0,
    'fleumatico': 0,
    'melancolico': 0,
    'colerico': 0,
  };

  List<Map<String, dynamic>> perguntas = [
    {
      'asset':'lib/assets/pessoas01.jpg',
      'texto': 'Quando você está em um grupo de pessoas, você:',
      'opcoes': {
        'Gosta de ser o centro das atenções': 'sanguineo',
        'Prefere observar e não falar muito': 'fleumatico',
        'Fica pensando sobre as coisas que estão sendo ditas': 'melancolico',
        'Toma a liderança naturalmente': 'colerico',
      },
    },
    {
      'asset':'lib/assets/pessoas02.jpg',
      'texto': 'Como você reage quando algo não sai como planejado?',
      'opcoes': {
        'Fica estressado e tenta controlar a situação': 'colerico',
        'Fica triste e se isola para refletir': 'melancolico',
        'Fica calmo e tenta encontrar uma solução': 'fleumatico',
        'Fica frustrado, mas logo passa e tenta outro caminho': 'sanguineo',
      },
    },
    {
      'asset':'lib/assets/pessoas03.jpg',
      'texto': 'Como você prefere passar seu tempo livre?',
      'opcoes': {
        'Socializando e se divertindo com amigos': 'sanguineo',
        'Lendo ou refletindo sozinho': 'melancolico',
        'Relaxando em casa, sem pressa': 'fleumatico',
        'Realizando atividades desafiadoras e produtivas': 'colerico',
      },
    },
    {
      'asset':'lib/assets/pessoas04.jpg',
      'texto': 'Quando você tem que tomar uma decisão difícil, você:',
      'opcoes': {
        'Toma uma decisão rápida e segue em frente': 'colerico',
        'Reflete muito antes de decidir': 'melancolico',
        'Tenta ver os dois lados e opta pela solução mais calma': 'fleumatico',
        'Busca o apoio dos outros para tomar a decisão': 'sanguineo',
      },
    },
    {
      'asset':'lib/assets/pessoas05.jpg',
      'texto': 'Você costuma ser:',
      'opcoes': {
        'Extrovertido e sempre disposto a conversar': 'sanguineo',
        'Mais introvertido, preferindo ambientes tranquilos': 'fleumatico',
        'Profundo e pensativo, gosta de analisar tudo': 'melancolico',
        'Enérgico e focado, gosta de estar no controle': 'colerico',
      },
    },
    {
      'asset':'lib/assets/pessoas06.jpg',
      'texto': 'Em uma discussão, você geralmente:',
      'opcoes': {
        'Fica calmo e tenta resolver a situação pacificamente': 'fleumatico',
        'Fala com entusiasmo e tenta convencer os outros': 'sanguineo',
        'Reflete profundamente sobre todos os pontos de vista': 'melancolico',
        'Defende sua opinião de forma firme e assertiva': 'colerico',
      },
    },
    {
      'asset':'lib/assets/pessoas07.jpg',
      'texto': 'Quando as coisas não estão indo bem, você:',
      'opcoes': {
        'Fica chateado, mas tenta manter a calma e esperar a situação melhorar': 'fleumatico',
        'Fica emocionalmente envolvido e expressa seus sentimentos': 'sanguineo',
        'Fica deprimido e começa a questionar tudo': 'melancolico',
        'Fica irritado e procura uma solução imediata': 'colerico',
      },
    },
    {
      'asset':'lib/assets/pessoas08.jpg',
      'texto': 'Como você reage a críticas?',
      'opcoes': {
        'Aceita de forma construtiva e tenta melhorar': 'fleumatico',
        'Fica animado para aprender com os outros': 'sanguineo',
        'Fica pensativo e reflete profundamente sobre o que foi dito': 'melancolico',
        'Fica defensivo e tenta justificar suas ações': 'colerico',
      },
    },
    {
      'asset':'lib/assets/pessoas09.jpg',
      'texto': 'Quando você conhece alguém novo, você:',
      'opcoes': {
        'Se sente à vontade e rapidamente começa a conversar': 'sanguineo',
        'Fica mais tímido e prefere esperar para ver a reação da outra pessoa': 'fleumatico',
        'Fica observando e analisando o comportamento da pessoa': 'melancolico',
        'Toma a iniciativa e tenta impressionar a pessoa': 'colerico',
      },
    },
    {
      'asset':'lib/assets/pessoas10.jpg',
      'texto': 'Quando você tem uma tarefa difícil, você:',
      'opcoes': {
        'Prefere fazer as coisas com calma, no seu próprio ritmo': 'fleumatico',
        'Fica empolgado e enfrenta a tarefa com energia': 'sanguineo',
        'Se preocupa muito com cada detalhe e busca a perfeição': 'melancolico',
        'Enfrenta o desafio com determinação e foco': 'colerico',
      },
    },
  ];

  @override
  void initState() {
    super.initState();
    escalasBotao = List.generate(perguntas[indicePergunta]['opcoes'].length, (index) => 1.0);
  }

  void responder(String opcaoSelecionada) {
    
    setState(() {
      pontuacoes[opcaoSelecionada] = pontuacoes[opcaoSelecionada]! + 1; 
    });

    if (indicePergunta + 1 < perguntas.length) {
      setState(() {
        indicePergunta++;
        escalasBotao = List.generate(perguntas[indicePergunta]['opcoes'].length, (index) => 1.0); 
      });
    } else {
      mostrarResultados(); 
    }
  }

  void mostrarResultados() {
   
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoQuiz(pontuacoes: pontuacoes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz - Seu Temperamento')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              
              Image.asset(
                perguntas[indicePergunta]['asset'],
                width: 200,
                height: 200,
                fit: BoxFit.contain, 
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Pergunta ${indicePergunta + 1} de ${perguntas.length}\n\n' + perguntas[indicePergunta]['texto'],
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
             
              ...perguntas[indicePergunta]['opcoes'].keys.map((opcao) {
                int index = perguntas[indicePergunta]['opcoes'].keys.toList().indexOf(opcao);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        escalasBotao[index] = 1.1; // Aumenta a escala do botão específico
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        escalasBotao[index] = 1.0; // Restaura a escala para o tamanho normal
                      });
                    },
                    child: Transform.scale(
                      scale: escalasBotao[index], // Controla a escala do botão específico
                      child: ElevatedButton(
                        onPressed: () => responder(perguntas[indicePergunta]['opcoes'][opcao]),
                        child: Text(opcao),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

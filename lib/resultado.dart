import 'package:flutter/material.dart';

class ResultadoQuiz extends StatelessWidget {
  final Map<String, int> pontuacoes;

  ResultadoQuiz({required this.pontuacoes});

  String obterResultado() {
    String resultado = 'Seu temperamento predominante é:\n';
    String temperamentoDominante = '';
    String descricaoTemperamento = '';

    int maiorPontuacao = pontuacoes.values.reduce((a, b) => a > b ? a : b);

    // Identificando o temperamento dominante
    if (pontuacoes['sanguineo'] == maiorPontuacao) {
      temperamentoDominante = 'Sanguíneo';
      descricaoTemperamento = 'O temperamento sanguíneo é caracterizado por pessoas extrovertidas, que gostam de estar no centro das atenções. '
          'São otimistas, sociáveis e tendem a ser espontâneas. Têm facilidade para fazer amigos e se entrosar com as pessoas.';
    } else if (pontuacoes['fleumatico'] == maiorPontuacao) {
      temperamentoDominante = 'Fleumático';
      descricaoTemperamento = 'O temperamento fleumático é associado a pessoas calmas, tranquilas e equilibradas. '
          'Elas preferem evitar conflitos, são boas ouvintes e sabem manter a serenidade em situações estressantes.';
    } else if (pontuacoes['melancolico'] == maiorPontuacao) {
      temperamentoDominante = 'Melancólico';
      descricaoTemperamento = 'O temperamento melancólico é caracterizado por pessoas introspectivas, pensativas e analíticas. '
          'Elas se preocupam com os detalhes e tendem a ser perfeccionistas. São sensíveis e muitas vezes preferem passar tempo sozinhas para refletir.';
    } else {
      temperamentoDominante = 'Colérico';
      descricaoTemperamento = 'O temperamento colérico é associado a pessoas enérgicas, focadas e determinadas. '
          'Elas têm uma grande capacidade de liderança e gostam de desafios. São rápidas para tomar decisões e podem ser um pouco impacientes.';
    }

    resultado += temperamentoDominante + '\n\n' + descricaoTemperamento;
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultado do Quiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              obterResultado(),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Botão para reiniciar o quiz
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Reiniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

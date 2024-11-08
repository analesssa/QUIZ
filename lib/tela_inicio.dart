import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título ou mensagem
            Text(
              'Comece sua jornada aqui! ',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Botão para iniciar o quiz
            ElevatedButton(
              onPressed: () {
                // Navega para a tela do quiz
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaQuiz()), // Navega para a tela PaginaQuiz
                );
              },
              child: Text('Iniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

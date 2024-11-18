import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            // Imagem com ajuste de tamanho
            Image.asset(
              'lib/assets/imagemincial.jpg', 
              width: 350, 
              height: 350,
              fit: BoxFit.contain,  
            ),
            SizedBox(height: 2), 
            // Título ou mensagem
            Text(
              'Comece sua jornada aqui!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), 
              child: TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Digite o seu nome aqui!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 6), 
            // Botão para iniciar o quiz
            ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text;
                if (nome.isNotEmpty) {
                  // Navega para a tela do quiz e passa o nome do usuário
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaginaQuiz(),
                    ),
                  );
                } else {
                  // Exibe um alerta caso o nome não tenha sido preenchido
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor, insira seu nome!')),
                  );
                }
              },
              child: Text('Iniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

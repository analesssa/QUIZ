import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PaginaQuiz()));
}

class PaginaQuiz extends StatefulWidget {
  @override
  _PaginaQuizState createState() => _PaginaQuizState();
}

class _PaginaQuizState extends State<PaginaQuiz> {
  int indicePergunta = 0;
  Map<String, int> pontuacoes = {}; // Armazenar pontuações por opção

  List<Map<String, dynamic>> perguntas = [
    {
      'texto': 'O que é Flutter?',
      'opcoes': {
        'Uma linguagem de programação': 0,
        'Um framework para desenvolvimento de aplicativos': 1,
        'Um banco de dados': 0,
        'Um sistema operacional': 0,
      },
    },
    {
      'texto':
          'Qual linguagem de programação é usada para desenvolver aplicativos Flutter?',
      'opcoes': {
        'Java': 0,
        'Dart': 1,
        'Kotlin': 0,
        'JavaScript': 0,
      },
    },
    {
      'texto': 'Qual widget é usado como contêiner básico em Flutter?',
      'opcoes': {
        'Column': 0,
        'Row': 0,
        'Container': 1,
        'Scaffold': 0,
      },
    },
    {
      'texto': 'Qual comando é usado para iniciar um novo projeto Flutter?',
      'opcoes': {
        'flutter create nome_do_projeto': 1,
        'flutter new nome_do_projeto': 0,
        'flutter start nome_do_projeto': 0,
        'flutter init nome_do_projeto': 0,
      },
    },
    {
      'texto': 'Qual widget é usado para exibir uma lista de itens em Flutter?',
      'opcoes': {
        'Column': 0,
        'ListView': 1,
        'GridView': 0,
        'Stack': 0,
      },
    },
    {
      'texto':
          'Qual comando é usado para compilar um aplicativo Flutter para a web?',
      'opcoes': {
        'flutter build web': 1,
        'flutter web build': 0,
        'flutter create web': 0,
        'flutter deploy web': 0,
      },
    },
    {
      'texto': 'O que é o "Hot Reload" no Flutter?',
      'opcoes': {
        'Reiniciar o aplicativo': 0,
        'Atualizar o estado do aplicativo sem perder os dados': 1,
        'Instalar dependências': 0,
        'Criar um novo projeto': 0,
      },
    },
    {
      'texto': 'Qual widget é usado para criar um botão em Flutter?',
      'opcoes': {
        'Button': 0,
        'RaisedButton': 0,
        'FlatButton': 0,
        'ElevatedButton': 1,
      },
    },
    {
      'texto':
          'Qual biblioteca é comumente usada para gerenciar estados em aplicativos Flutter?',
      'opcoes': {
        'Provider': 1,
        'Axios': 0,
        'Redux': 0,
        'Firebase': 0,
      },
    },
    {
      'texto':
          'Qual é a função principal de um arquivo `pubspec.yaml` em um projeto Flutter?',
      'opcoes': {
        'Definir a estrutura do aplicativo': 0,
        'Gerenciar dependências e configurações do projeto': 1,
        'Configurar a interface do usuário': 0,
        'Especificar rotas do aplicativo': 0,
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
    pontuacoes.forEach((opcao, score) {
      resultado += '$opcao: $score\n';
    });

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
      body: Column(
        children: [
          // Adicionando a imagem
          Image.asset(
            'lib/asserts/meme.jpg', // Substitua pelo link direto da imagem
            fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              perguntas[indicePergunta]['texto'],
              style: TextStyle(fontSize: 18),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'questionario.dart';

void main(List<String> args) => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'pergunta': 'Qual a sua cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'verde', 'pontuacao': 5},
        {'texto': 'vermelho', 'pontuacao': 3},
        {'texto': 'amarelo', 'pontuacao': 1},
      ],
    },
    {
      'pergunta': 'Qual é o teu filme preferido?',
      'resposta': [
        {'texto': 'Deadpool', 'pontuacao': 5},
        {'texto': 'Super Mário', 'pontuacao': 3},
        {'texto': 'Gente Grande', 'pontuacao': 1},
        {'texto': 'Homem-Aranha', 'pontuacao': 10},
      ],
    },
    {
      'pergunta': 'Qual é o teu desenho preferido?',
      'resposta': [
        {'texto': 'Dragon Ball', 'pontuacao': 10},
        {'texto': 'Death Note', 'pontuacao': 5},
        {'texto': 'Parasyte', 'pontuacao': 3},
        {'texto': 'My Hero Academy', 'pontuacao': 1},
      ],
    }
  ];

  void _resposta(int pontuacao) {
    if (questionSelected) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get questionSelected {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Perguntas'),
        ),
        body: questionSelected
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _resposta)
            : Resultado(
                pontuacaoTotal: _pontuacaoTotal,
                quandoReinicarQuestionario: _reiniciarQuestionario,
              ),
      ),
    );
  }
}

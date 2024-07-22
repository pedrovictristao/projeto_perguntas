import 'package:flutter/material.dart';
import 'questao.dart';
import 'respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  const Questionario(
      {super.key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.quantoResponder});

  bool get questionSelected {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = questionSelected
        ? perguntas[perguntaSelecionada].cast()['resposta']
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['pergunta'] as String),
        ...respostas.map((resp) {
          return Respostas(
            resp['texto'] as String,
            () => quantoResponder(resp['pontuacao'] as int),
          );
        }),
      ],
    );
  }
}

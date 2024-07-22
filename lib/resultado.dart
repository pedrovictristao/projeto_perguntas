import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() quandoReinicarQuestionario;

  const Resultado({
    required this.pontuacaoTotal,
    super.key,
    required this.quandoReinicarQuestionario,
  });

  String get fraseResultado {
    if (pontuacaoTotal < 8) {
      return 'Parabéns';
    } else if (pontuacaoTotal < 12) {
      return 'MEC';
    } else if (pontuacaoTotal < 16) {
      return 'BAGUÁ';
    } else {
      return 'TOP!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReinicarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

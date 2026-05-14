import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  Resultado(this.pontuacao, this.reiniciarQuestionario);

  final void Function() reiniciarQuestionario;

  String get fraseResultado {
    if (pontuacao < 9) {
      return 'Parabens!!\nPontuacao: $pontuacao';
    } else if (pontuacao < 12) {
      return 'Parabens, voce foi bem!!\nPontuacao: $pontuacao';
    } else if (pontuacao < 16) {
      return 'Parabens, voce foi muito bem!!\nPontuacao: $pontuacao';
    } else {
      return 'Parabens, voce foi incrivel!!\nPontuacao: $pontuacao';
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
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
            onPressed: reiniciarQuestionario,
            child: Text('Reiniciar'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, onPrimary: Colors.white))
      ],
    );
  }
}

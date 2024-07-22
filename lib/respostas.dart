import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String text;
  final void Function() onSelected;

  Respostas(this.text, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
        onPressed: onSelected,
        child: Text(text),
      ),
    );
  }
}

//academico: Ronaldo Dranski
//ADSIS5S

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Calculadora()));

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '0';

  void pressionar(String tecla) {
    setState(() {
      if (tecla == 'C') display = '0';
      else display = (display == '0') ? tecla : display + tecla;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: Column(
        children: [
          Expanded(child: Container(alignment: Alignment.bottomRight, padding: EdgeInsets.all(24), child: Text(display, style: TextStyle(fontSize: 48)))),
          Row(children: [BotaoCalc(texto: '7', click: pressionar), BotaoCalc(texto: '8', click: pressionar), BotaoCalc(texto: '9', click: pressionar), BotaoCalc(texto: '/', click: pressionar)]),
          Row(children: [BotaoCalc(texto: 'C', click: pressionar), BotaoCalc(texto: '=', click: pressionar)]),
        ],
      ),
    );
  }
}

class BotaoCalc extends StatelessWidget {
  final String texto;
  final Function(String) click;
  BotaoCalc({required this.texto, required this.click});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(onPressed: () => click(texto), child: Text(texto)),
    );
  }
}

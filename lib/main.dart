import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();
  String _textoInfo = "Informe seus dados";


void _calcular_imc(){
  setState((){
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);
    double imc  = peso / pow ((altura/100), 2);

    if (imc < 18.5){
      _textoInfo = "Desnutrido (${imc})";
    }
    if (imc >=18.6){
      _textoInfo = "Peso ideal(${imc})";
    }
    if (imc>=25.0){
      _textoInfo = "Levemente acima do peso(${imc})";
    }
    if (imc>=30.0){
      _textoInfo = "Obesidade grau 1(${imc})";
    }
    if (imc>=35.0){
      _textoInfo = "Obesidade grau 2 (${imc})";
    }
    if (imc>=40.0){
      _textoInfo = "Obesidade grau 3 (mórbida) (${imc})";
    }

  });
}
void _limpar_Tela (){
  pesoController.text = "";
  alturaController.text = "";
  setState(() {
    _textoInfo = "Informe seus dados";
  });

}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Calculadora IMC"),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      actions: <Widget>[
        IconButton(onPressed: _limpar_Tela, icon: const Icon(Icons.refresh)
        )
      ],
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          const Icon(
            Icons.person_outline,
            size: 170.0,
            color: Colors.blueAccent,
          ),
           TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "PESO (KG)",
              labelStyle: TextStyle(color: Colors.blueAccent),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0),
            controller: pesoController,
          ),
          //Segunda Input para a altura
           TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "ALTURA (cm)",
              labelStyle: TextStyle(color: Colors.blueAccent),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0),
            controller: alturaController,
          ),

          //Botão para executar a calculadora do IMC
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SizedBox(
              height: 50.0,

              child: ElevatedButton(
                  onPressed: _calcular_imc,
                  child: const Text("Calcular"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                ),
              ),
            ),
          ),

          Text(
            _textoInfo,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 25.0,
            ),
          )
        ],
      ),
    ),// This trailing comma makes auto-formatting nicer for build methods.
  );
 }
}


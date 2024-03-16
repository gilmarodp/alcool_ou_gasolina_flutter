import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = '';

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = 'Número inválido, digite números maiores do que 0 e utilize (.)';
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = 'Melhor abstecer com a gasolina';
        });
      } else {
        setState(() {
          _textoResultado = 'Melhor abstecer com a álcool';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Álcool ou Gasolina',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Saiba qual a melhor opção para abastecimento do seu carro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Preço Álcool, ex: 1.59',
                ),
                keyboardType: TextInputType.number,
                controller: _controllerAlcool,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Preço Gasolina, ex: 3.15',
                ),
                keyboardType: TextInputType.number,
                controller: _controllerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () => _calcular(),
                  child: const Text('Calcular'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _textoResultado,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
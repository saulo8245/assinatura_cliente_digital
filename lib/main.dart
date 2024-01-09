import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assinatura Digital',
      home: SignaturePad(),
    );
  }
}

class SignaturePad extends StatefulWidget {
  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  // Caneta
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    //Ocupar 60% da tela em altura
    double targetHeight = screenHeight * 0.6;
    //Ocupar 95% da tela largura
    double targetWidth = screenWidth * 0.95;
    //Coloquei em % para se ficar responsivo em qualquer aparelho celular.
    //E tambem ao usar o celular de forma horizontal ele ja fica responsivo

    return Scaffold(
      appBar: AppBar(
        title: Text('Assine Aqui'),
      ),
      body: Column(
        children: [
          Container(
            height: targetHeight,
            width: targetWidth,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Cor da borda
                width: 2.0, // Largura da borda
              ),
            ),
            child: Signature(
              controller: _controller,
              backgroundColor: Colors.white,
              height: targetHeight,
              width: targetWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  child: Text('Limpar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Salvar a assinatura ou realizar ações adicionais aqui
                    // Exemplo: salvarImagem(_controller.toPngBytes());
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
  //Caneta
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assine Aqui'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Signature(
              controller: _controller,
              height: 300,
              backgroundColor: Colors.white,
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

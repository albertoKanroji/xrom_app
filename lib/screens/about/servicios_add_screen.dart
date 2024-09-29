import 'package:flutter/material.dart';

class QuienSomosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de tu Cuenta'),
      ),
      body: Center(
        child: Text(
          'Vista de Datos de tu Cuenta',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

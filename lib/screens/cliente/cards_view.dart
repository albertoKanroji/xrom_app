import 'package:flutter/material.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjetas'),
      ),
      body: Center(
        child: Text(
          'Vista de Tarjetas',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

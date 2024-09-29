import 'package:flutter/material.dart';

class AddressesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direcciones'),
      ),
      body: Center(
        child: Text(
          'Vista de Direcciones',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

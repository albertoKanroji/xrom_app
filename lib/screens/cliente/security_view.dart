import 'package:flutter/material.dart';

class SecurityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seguridad'),
      ),
      body: Center(
        child: Text(
          'Vista de Seguridad',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

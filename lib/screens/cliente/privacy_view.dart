import 'package:flutter/material.dart';

class PrivacyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacidad'),
      ),
      body: Center(
        child: Text(
          'Vista de Privacidad',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

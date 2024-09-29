import 'package:flutter/material.dart';

class CommunicationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comunicaciones'),
      ),
      body: Center(
        child: Text(
          'Vista de Comunicaciones',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

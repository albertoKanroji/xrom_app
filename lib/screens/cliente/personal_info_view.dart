import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información Personal'),
      ),
      body: Center(
        child: Text(
          'Vista de Información Personal',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

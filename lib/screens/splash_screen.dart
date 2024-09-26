import 'package:flutter/material.dart';
import 'package:xrom_app/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
 
final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF006084), // Azul oscuro
              Color(0xFF69FF29), // Verde brillante
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.asset(
                'assets/logo_login.png', // Asegúrate de que la ruta sea correcta
                height: 300,
              ),
              const SizedBox(height: 20),
              
              // Texto "Bienvenido"
              const Text(
                'Desarrollado por XROM SYSTEMS',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

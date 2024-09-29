import 'package:flutter/material.dart';

class QuienSomosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿Quiénes Somos?'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Espacio para el logo
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/logo-xrom.jpg', // Ruta de tu imagen
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sección "¿Quiénes Somos?"
            _buildSectionHeader('¿Quiénes Somos?', Icons.people),
            _buildTextContainer(
              'Nuestro equipo de trabajo está conformado por ingenieros apasionados de la tecnología y el diseño gráfico, cada uno con habilidades y cualidades que hacen la combinación perfecta para desarrollar cualquier proyecto o reto que se presente. Así mismo, nos capacitamos día con día para ofrecer a nuestros clientes soluciones de acuerdo a sus necesidades en tecnologías de la información, siempre contribuyendo al crecimiento de nuestros clientes en todos los aspectos.',
            ),
            const SizedBox(height: 20),

            // Sección "Misión"
            _buildSectionHeader('Misión', Icons.flag),
            _buildTextContainer(
              'Brindar servicios de alta calidad en el campo de desarrollo de software, siendo un equipo comprometido en satisfacer las necesidades de nuestros clientes, mediante servicios de consultoría, soporte, capacitación y soluciones de software de última tecnología.',
            ),
            const SizedBox(height: 20),

            // Sección "Visión"
            _buildSectionHeader('Visión', Icons.visibility),
            _buildTextContainer(
              'Seguiremos construyendo nuestro futuro, siendo una empresa competitiva que ofrezca servicios de desarrollo de sistemas e investigación de nuevas tecnologías, generando relaciones con nuestros clientes.',
            ),
            const SizedBox(height: 20),

            // Sección "Valores"
            _buildSectionHeader('Valores', Icons.star),
            _buildTextContainer(
              '• Ética.\n'
              '• Profesionalismo.\n'
              '• Innovación y Creatividad.\n'
              '• Confidencialidad.\n'
              '• Honestidad.\n'
              '• Pasión.\n'
              '• Máxima Calidad en todos nuestros servicios.\n'
              '• Confianza.',
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Método para construir encabezados de sección con íconos
  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.green[800], size: 28),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
      ],
    );
  }

  // Método para construir contenedores estilizados para el texto
  Widget _buildTextContainer(String text) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.green, width: 1.0),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

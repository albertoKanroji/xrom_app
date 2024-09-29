import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ServiciosTab extends StatelessWidget {
  final List<Service> services = [
    Service(
      title: 'Mantenimiento de PC',
      description:
          'Limpieza, optimización y reparación de equipos de escritorio.',
      icon: Icons.build,
      waitingTime: '2-3 días',
      priceRange: '\$50 - \$200',
    ),
    Service(
      title: 'Instalación de Starlink',
      description:
          'Configuración y montaje de equipos Starlink para internet satelital.',
      icon: Icons.satellite,
      waitingTime: '1 día',
      priceRange: '\$100 - \$300',
    ),
    Service(
      title: 'Armado de PC',
      description: 'Ensamblaje personalizado de PCs de alto rendimiento.',
      icon: Icons.memory,
      waitingTime: '3-5 días',
      priceRange: '\$150 - \$500',
    ),
    Service(
      title: 'Reparación de Laptops',
      description: 'Diagnóstico y reparación de fallos en equipos portátiles.',
      icon: Icons.laptop,
      waitingTime: '1-2 días',
      priceRange: '\$80 - \$250',
    ),
    Service(
      title: 'Actualización de Software',
      description:
          'Instalación y actualización de software esencial para el rendimiento.',
      icon: Icons.system_update,
      waitingTime: '1 día',
      priceRange: '\$30 - \$100',
    ),
    Service(
      title: 'Desarrollo de Apps',
      description: 'Creación de aplicaciones móviles para iOS y Android.',
      icon: Icons.phone_android,
      waitingTime: '2-4 semanas',
      priceRange: '\$2000 - \$5000',
    ),
    Service(
      title: 'Consultoría en TI',
      description: 'Asesoramiento y soluciones en tecnología para empresas.',
      icon: Icons.business,
      waitingTime: 'Dependiendo del proyecto',
      priceRange: '\$500 - \$2000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return GestureDetector(
            onTap: () {
              _showServiceDetails(context, service);
            },
            child: _buildServiceCard(service, screenWidth),
          );
        },
      ),
    );
  }

  // Método para construir las tarjetas de servicios
  Widget _buildServiceCard(Service service, double screenWidth) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 103, 241, 11),
              Color.fromARGB(255, 69, 71, 71)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              service.icon,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para mostrar el BottomSheet con detalles del servicio
  void _showServiceDetails(BuildContext context, Service service) {
    final screenHeight =
        MediaQuery.of(context).size.height; // Obtener la altura de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          minChildSize: 0.6,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título del servicio
                    Center(
                      child: Text(
                        service.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Descripción detallada del servicio
                    Text(
                      service.description,
                      style:  TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Tarjeta de detalles (Tiempo de espera y Precio)
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.timer,
                                    color: Colors.blue, size: 30),
                                const SizedBox(height: 8),
                                const Text('Tiempo de espera'),
                                Text(
                                  service.waitingTime,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.attach_money,
                                    color: Colors.green, size: 30),
                                const SizedBox(height: 8),
                                const Text('Precio'),
                                Text(
                                  service.priceRange,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Información adicional
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // ignore: prefer_const_constructors
                            Icon(Icons.info_outline, color: Colors.orange, size: 30),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Este servicio incluye una garantía de satisfacción y soporte técnico adicional.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Sección de Calificación
                    const Text(
                      'Calificación:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Calificación
                    _buildRatingSection(screenHeight),
                    const SizedBox(height: 16),

                    // Comentarios
                    const Text(
                      'Comentarios:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildComment(
                        'Las Danis', 'Excelente servicio, muy profesional.'),
                    _buildComment('Sol', '¡Muy recomendado!'),
                    const SizedBox(height: 16),

                    // Botones de acción
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Acción para contratar el servicio
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Contratar Servicio'),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // Acción para consultar más información
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Consultar Más'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Botón "Cerrar"
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Cerrar el BottomSheet
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Cerrar'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildRatingSection(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Puntaje general y estrellas
        Row(
          children: [
            Text(
              '4.8',
              style: TextStyle(
                fontSize: screenHeight * 0.05, // Tamaño grande del puntaje
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.blue,
                  size: screenHeight * 0.03,
                );
              }),
            ),
            const SizedBox(width: 8),
            Text(
              '39 calificaciones',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Distribución de las calificaciones
        _buildRatingDistributionRow(5, 0.8, screenHeight),
        _buildRatingDistributionRow(4, 0.6, screenHeight),
        _buildRatingDistributionRow(3, 0.4, screenHeight),
        _buildRatingDistributionRow(2, 0.2, screenHeight),
        _buildRatingDistributionRow(1, 0.1, screenHeight),
        const SizedBox(height: 16),

        // Calificación de características
        Text(
          'Calificación de características:',
          style: TextStyle(
            fontSize: screenHeight * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _buildCharacteristicRating(
            'Relación precio-calidad', 4.5, screenHeight),
        _buildCharacteristicRating('Durabilidad', 4.0, screenHeight),
      ],
    );
  }

  Widget _buildRatingDistributionRow(
      int starCount, double fillPercent, double screenHeight) {
    return Row(
      children: [
        Text('$starCount', style: TextStyle(fontSize: screenHeight * 0.02)),
        const SizedBox(width: 4),
        Icon(Icons.star, color: Colors.grey, size: screenHeight * 0.025),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: fillPercent,
            backgroundColor: Colors.grey[200],
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildCharacteristicRating(
      String title, double rating, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenHeight * 0.02,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: index < rating ? Colors.blue : Colors.grey,
              size: screenHeight * 0.025,
            );
          }),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  // Método para construir los comentarios
  Widget _buildComment(String user, String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Clase para modelar los servicios
class Service {
  final String title;
  final String description;
  final IconData icon;
  final String waitingTime;
  final String priceRange;

  Service({
    required this.title,
    required this.description,
    required this.icon,
    required this.waitingTime,
    required this.priceRange,
  });
}

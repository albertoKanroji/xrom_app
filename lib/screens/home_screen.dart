import 'package:flutter/material.dart';
import 'package:xrom_app/controllers/cart_controller.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
    final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra de búsqueda
          const SizedBox(height: 20),
          
          // Slider horizontal de ofertas
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Ofertas',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Número de elementos en el slider
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(left: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/offer_${index + 1}.jpg'), // Imagen de oferta
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      'Oferta ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Sección de "Productos Destacados"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Productos Destacados',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Número de productos a mostrar
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: 'assets/product_${index + 1}.jpg', // Imagen del producto
                  title: 'Dell Latitude 771${index + 1}',
                  price: '\$${(index + 1) * 100}.00',
                  description: 'Descripción breve del producto ${index + 1}.',
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Widget personalizado para mostrar los productos
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showProductDetails(context);
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(left: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: const TextStyle(fontSize: 16, color: Colors.orange),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para mostrar los detalles del producto en un modal
  void _showProductDetails(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height; // Obtener la altura de la pantalla
  final screenWidth = MediaQuery.of(context).size.width;   // Obtener el ancho de la pantalla

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
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
                  // Imagen ampliada
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageUrl,
                      height: screenHeight * 0.3, // 30% de la altura de la pantalla
                      width: screenWidth,         // Ancho completo de la pantalla
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Título del producto
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Descripción corta
                  Text(
                    'Este es un hub USB C 12-en-1 con múltiples funcionalidades...',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Precio y descuento
                  Row(
                    children: [
                      Text(
                        '\$1139.12',
                        style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '50% OFF',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Detalles adicionales
                  Text(
                    'En 3 meses sin intereses de \$189.85',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'IVA incluido',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Información de entrega
                  Text(
                    'Llega gratis entre el 5 y el 6/oct',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Stock disponible
                  Text(
                    'Stock disponible',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Botones de compra
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Lógica de compra
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Comprar ahora'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Lógica de agregar al carrito
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Agregar al carrito'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Características del producto
                  Text(
                    'Características:',
                    style: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Table(
                    border: TableBorder.all(color: Colors.grey, width: 0.5),
                    children: [
                      _buildTableRow('Procesador', 'Intel Core i7'),
                      _buildTableRow('RAM', '16 GB'),
                      _buildTableRow('Almacenamiento', '512 GB SSD'),
                      _buildTableRow('Pantalla', '15.6" Full HD'),
                      _buildTableRow('Sistema Operativo', 'Windows 11'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Calificación
                  _buildRatingSection(screenHeight),
                  const SizedBox(height: 16),

                  // Comentarios
                  _buildComment('Allan Duvalier', 'Excelente laptop, muy rápida y ligera.'),
                  _buildComment('Las Danis', 'Buena calidad de imagen y rendimiento.'),
                  const SizedBox(height: 16),

                  // Botón "Cerrar"
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Cerrar la modal
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

Widget _buildComment(String user, String comment) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.grey,
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
TableRow _buildTableRow(String feature, String value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          feature,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(value),
      ),
    ],
  );
}
// Sección de calificación (similar a la imagen proporcionada)
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
      _buildCharacteristicRating('Relación precio-calidad', 4.5, screenHeight),
      _buildCharacteristicRating('Durabilidad', 4.0, screenHeight),
    ],
  );
}

// Construir fila para distribución de calificaciones
Widget _buildRatingDistributionRow(int starCount, double fillPercent, double screenHeight) {
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

// Construir fila para la calificación de características
Widget _buildCharacteristicRating(String title, double rating, double screenHeight) {
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

}

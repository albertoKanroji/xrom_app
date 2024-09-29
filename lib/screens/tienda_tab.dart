import 'package:flutter/material.dart';

class TiendaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox(height: 22),

            // Opciones de categorías
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryCard(Icons.percent, 'Todas las ofertas'),
                  _buildCategoryCard(Icons.flash_on, 'Ofertas relámpago'),
                  _buildCategoryCard(Icons.videogame_asset, 'Zone Gaming'),
                  _buildCategoryCard(Icons.star, 'Hogar seguro'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Lista de productos (GridView)
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: 4, // Número de productos a mostrar
              itemBuilder: (context, index) {
                return _buildProductCard(
                  'assets/product_${index + 1}.jpg',
                  'Producto ${index + 1}',
                  '\$${(index + 1) * 1000}',
                  '${(index + 1) * 20}% OFF',
                  'Llega gratis mañana',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Construir tarjeta de categoría
  Widget _buildCategoryCard(IconData icon, String title) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Construir tarjeta de producto
  Widget _buildProductCard(
      String imageUrl, String title, String price, String discount, String deliveryInfo) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título del producto
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),

                // Precio y descuento
                Text(
                  price,
                  style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  discount,
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
                const SizedBox(height: 4),

                // Información de entrega
                Text(
                  deliveryInfo,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

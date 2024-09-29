import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem(
      imageUrl: 'assets/product_1.jpg',
      name: 'Scarlett Whitening',
      description: 'Brightly Serum',
      price: 10.3,
      quantity: 1,
    ),
    CartItem(
      imageUrl: 'assets/product_2.jpg',
      name: 'Ponds White Series',
      description: '4 Products',
      price: 21.93,
      quantity: 1,
    ),
    CartItem(
      imageUrl: 'assets/product_3.jpg',
      name: 'Emina Bright Stuff',
      description: 'Face Serum',
      price: 11.56,
      quantity: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text('Carrito', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 48, 224, 13),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(child: _buildCartItemsList()),
            _buildBottomSummary(total),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItemsList() {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  item.imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildQuantityButton(Icons.remove, () {
                          // Decrease quantity logic
                        }),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '${item.quantity}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        _buildQuantityButton(Icons.add, () {
                          // Increase quantity logic
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () {
                      // Remove item logic
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }

  Widget _buildBottomSummary(double total) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Amount Price: \$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              // Checkout logic
            },
            child: Row(
              children: [
                const Text(
                  'Check Out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${cartItems.length}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Modelo para representar los productos del carrito
class CartItem {
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final int quantity;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });
}

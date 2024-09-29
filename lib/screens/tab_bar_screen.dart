import 'package:flutter/material.dart';
import 'package:xrom_app/screens/buscar_screen.dart';
import 'package:xrom_app/screens/carrito_screen.dart';
import 'package:xrom_app/screens/home_screen.dart';
import 'package:xrom_app/screens/tienda_tab.dart';
import 'package:xrom_app/screens/servicios_tab.dart';
import 'package:xrom_app/screens/cuenta_tab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Número de pestañas
      child: Scaffold(
          appBar: AppBar(
        title: InkWell(
          onTap: () {
            // Navigate to the SearchScreen when tapping on the search bar
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            );
          },
          child: SizedBox(
            height: 50,
            child: TextField(
              enabled: false, // Disable input in this TextField to make it a tappable button
              decoration: InputDecoration(
                hintText: 'Buscar en Xrom Store',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarritoScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 48, 224, 13), // Customize AppBar color
      ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            HomeTab(),
            TiendaTab(),
            ServiciosTab(),
            CuentaTab(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 1), // Borde superior
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -3), // Sombra en la parte superior
              ),
            ],
          ),
          
          height: 70, // Aumenta la altura del TabBar
          child: const TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.green,
            tabs: [
              Tab(icon: Icon(Icons.home, size: 30),text: 'Inicio',), // Aumenta el tamaño del ícono si es necesario
              Tab(icon: Icon(Icons.store, size: 30),text: 'Tienda',),
              Tab(icon: Icon(Icons.build, size: 30),text: 'Servicios',),
              Tab(
                // Imagen personalizada para la pestaña de "Mi Cuenta"
                icon: CircleAvatar(
                  radius: 15, // Controla el tamaño del círculo (icono de la misma altura)
                  backgroundImage: AssetImage('assets/profile_image.jpeg'),
                ),
                text: 'Mi Cuenta',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

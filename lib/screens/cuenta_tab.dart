import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xrom_app/screens/about/quien_somos_screen.dart';
import 'package:xrom_app/screens/cliente/account_data_view.dart';
import 'package:xrom_app/screens/cliente/addresses_view.dart';
import 'package:xrom_app/screens/cliente/cards_view.dart';
import 'package:xrom_app/screens/cliente/communications_view.dart';
import 'package:xrom_app/screens/cliente/personal_info_view.dart';
import 'package:xrom_app/screens/cliente/privacy_view.dart';
import 'package:xrom_app/screens/cliente/security_view.dart';
import 'package:xrom_app/screens/cliente/xrom_plus_view.dart';

class CuentaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Establecer el fondo de toda la vista a blanco
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Encabezado con la foto de perfil, nombre y correo electrónico
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_image.jpeg'), // Ruta de la imagen
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Jesus Hernandez',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'luismiq123456789@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tarjeta informativa
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green, width: 1.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '“Mi perfil” Pendiente a revisión.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[800],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.green),
                    onPressed: () {
                      // Acción al presionar cerrar
                    },
                  ),
                ],
              ),
            ),

            // Lista de elementos - Configuraciones de la cuenta
            _buildListItem(
              icon: Icons.person,
              color: Colors.green,
              title: 'Información personal',
              subtitle: 'Información de tu identificación oficial y tu actividad fiscal.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInfoView(),
                  ),
                );
              },
            ),
            _buildListItem(
              icon: Icons.account_box,
              color: Colors.green,
              title: 'Datos de tu cuenta',
              subtitle: 'Datos que representan la cuenta en Xrom Systems.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountDataView(),
                  ),
                );
              },
            ),
            _buildListItem(
              icon: Icons.security,
              color: Colors.green,
              title: 'Seguridad',
              subtitle: 'Tienes configurada la seguridad de tu cuenta.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecurityView(),
                  ),
                );
              },
            ),
            _buildListItem(
              icon: Icons.star,
              color: Colors.green,
              title: 'Xrom+',
              subtitle: 'Suscripción con beneficios en envíos, compras y entretenimiento.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => XromPlusView(),
                  ),
                );
              },
            ),
            _buildListItem(
              icon: Icons.credit_card,
              color: Colors.green,
              title: 'Tarjetas',
              subtitle: 'Tarjetas guardadas en tu cuenta.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardsView(),
                  ),
                );
              },
            ),
            _buildListItem(
              icon: Icons.location_on,
              color: Colors.green,
              title: 'Direcciones',
              subtitle: 'Direcciones guardadas en tu cuenta.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressesView(),
                  ),
                );
              },
            ),
            _buildListItem(
              icon: Icons.privacy_tip,
              color: Colors.green,
              title: 'Privacidad',
              subtitle: 'Preferencias y control sobre el uso de tus datos.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyView(),
                  ),
                );
              },
            ),
            _buildListItem(
              icon: Icons.notifications,
              color: Colors.green,
              title: 'Comunicaciones',
              subtitle: 'Elige qué tipo de información quieres recibir.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunicationsView(),
                  ),
                );
              },
            ),

            // Separador
            Divider(
              thickness: 1,
              color: Colors.grey[300],
              indent: 16,
              endIndent: 16,
            ),

            // Nueva Sección: Nosotros como empresa
            _buildListItem(
              icon: Icons.business,
              color: Colors.blue,
              title: 'Nosotros',
              subtitle: 'Conoce más sobre nuestra empresa.',
              onTap: () {
                // Acción al presionar
              },
            ),
            _buildListItem(
              icon: Icons.contact_page,
              color: Colors.blue,
              title: 'Contacto',
              subtitle: 'Ponte en contacto con nosotros.',
              onTap: () {
                // Acción al presionar
              },
            ),
            _buildListItem(
              icon: Icons.group,
              color: Colors.blue,
              title: 'Quiénes Somos',
              subtitle: 'Información sobre nuestro equipo.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuienSomosView(),
                  ),
                );
              },
            ),
            _buildListItem(
              icon: Icons.info,
              color: Colors.blue,
              title: 'Servicios Adicionales',
              subtitle: 'Descubre nuestros servicios adicionales.',
              onTap: () {
                // Acción al presionar
              },
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir los elementos de la lista
  Widget _buildListItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

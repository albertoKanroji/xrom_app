// import 'package:pusher_client/pusher_client.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class PusherService {
//   late PusherClient pusher;
//   late Channel channel;
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   PusherService() {
//     // Inicializar Pusher
//     pusher = PusherClient(
//       '2d9e88bba0a843077168', // Reemplaza con tu clave de Pusher
//       PusherOptions(
//         cluster: 'us2', // Reemplaza con tu cluster de Pusher
//       ),
//       autoConnect: true,
//     );

//     // Suscribirse a un canal y escuchar eventos
//     channel = pusher.subscribe(
//         'user.1'); // Reemplaza 'your-channel' con el nombre de tu canal

//     // Escuchar eventos en el canal
//     channel.bind('MessageSent', (PusherEvent? event) {
//       if (event != null && event.data != null) {
//         _showNotification(
//             event.data!); // Mostrar notificación cuando se recibe un evento
//       }
//     });

//     // Inicializar las notificaciones locales
//     _initializeNotifications();
//   }

//   // Inicializar las notificaciones locales
//   Future<void> _initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings initializationSettingsIos =
//         DarwinInitializationSettings();
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIos,
//     );

//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//   }

//   // Mostrar notificación
//   Future<void> _showNotification(String message) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       importance: Importance.high,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Nueva Notificación',
//       message,
//       platformChannelSpecifics,
//     );
//   }
// }

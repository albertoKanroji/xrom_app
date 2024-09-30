import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xrom_app/screens/cliente/account_data_view.dart';
import 'package:xrom_app/screens/cliente/addresses_view.dart';
import 'package:xrom_app/screens/cliente/cards_view.dart';
import 'package:xrom_app/screens/cliente/communications_view.dart';
import 'package:xrom_app/screens/cliente/personal_info_view.dart';
import 'package:xrom_app/screens/cliente/privacy_view.dart';
import 'package:xrom_app/screens/cliente/security_view.dart';
import 'package:xrom_app/screens/cliente/xrom_plus_view.dart';
// import 'package:xrom_app/services/pusher_service.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xrom_app/screens/tab_bar_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await GetStorage.init(); 
  //PusherService();
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Splash to Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home', // Ruta inicial
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()), 
         GetPage(name: '/personal_info', page: () => PersonalInfoView()),
        GetPage(name: '/account_data', page: () => AccountDataView()),
        GetPage(name: '/security', page: () => SecurityView()),
        GetPage(name: '/xrom_plus', page: () => XromPlusView()),
        GetPage(name: '/cards', page: () => CardsView()),
        GetPage(name: '/addresses', page: () => AddressesView()),
        GetPage(name: '/privacy', page: () => PrivacyView()),
        GetPage(name: '/communications', page: () => CommunicationsView()),
      ],
    );
  }
}

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Simulamos un delay de 3 segundos y luego navegamos al login
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/login'); // Reemplazamos el splash con el login
    });
  }
}
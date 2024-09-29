import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../env.dart';
import 'package:xrom_app/screens/tab_bar_screen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final storage = GetStorage(); // Inicializar GetStorage

  // Validar el correo electrónico
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'El correo no puede estar vacío';
    }
    if (!GetUtils.isEmail(email)) {
      return 'Ingresa un correo válido';
    }
    return null;
  }

  // Validar la contraseña
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'La contraseña no puede estar vacía';
    }
    if (password.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }
    return null;
  }

  // Método para iniciar sesión
  Future<void> login() async {
    String? emailError = validateEmail(emailController.text);
    String? passwordError = validatePassword(passwordController.text);

    if (kDebugMode) {
      print(emailError);
    }
    if (kDebugMode) {
      print(passwordError);
    }
    if (emailError != null || passwordError != null) {
      Get.snackbar('Error', emailError ?? passwordError!,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    try {
      var response = await http.post(
        Uri.parse('${Env.baseUrl}/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Parsear la respuesta JSON
        var data = jsonDecode(response.body);

        // Guardar el token y los datos del usuario en Get Storage
        storage.write('access_token', data['access_token']);
        storage.write('user', data['user']);

        isLoading.value = false;

        // Mostrar mensaje de éxito
        Get.snackbar('Éxito', '¡Inicio de sesión exitoso!',
            snackPosition: SnackPosition.TOP);
        Get.offAll(() => HomeScreen());
        // Aquí puedes navegar a la pantalla principal después del login
      } else {
        // Manejar error de login
        isLoading.value = false;
        Get.snackbar(
            'Error', 'Error al iniciar sesión. Revisa tus credenciales.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
      Get.snackbar('Error', 'Error de conexión. Inténtalo de nuevo.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Método para alternar la visibilidad de la contraseña
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}

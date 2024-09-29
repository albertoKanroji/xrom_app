import 'package:get/get.dart';

// Modelo para los elementos del carrito
class CartItem {
  final String imageUrl;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartController extends GetxController {
  // Lista observable de elementos en el carrito
  var cartItems = <CartItem>[].obs;

  // Total observable
  var total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialProducts(); // Cargar productos precargados
    _updateTotal();
  }

  // Cargar productos precargados
  void loadInitialProducts() {
    var initialProducts = [
      CartItem(
        imageUrl: 'assets/product_1.jpg',
        name: 'Laptop Gamer',
        price: 1200.0,
        quantity: 1,
      ),
      CartItem(
        imageUrl: 'assets/product_1.jpg',
        name: 'Auriculares Inalámbricos',
        price: 150.0,
        quantity: 1,
      ),
      CartItem(
        imageUrl: 'assets/product_1.jpg',
        name: 'Teclado Mecánico RGB',
        price: 75.0,
        quantity: 1,
      ),
      CartItem(
        imageUrl: 'assets/product_1.jpg',
        name: 'Mouse Gaming',
        price: 50.0,
        quantity: 1,
      ),
      CartItem(
        imageUrl: 'assets/product_1.jpg',
        name: 'Smartwatch Deportivo',
        price: 200.0,
        quantity: 1,
      ),
      CartItem(
        imageUrl: 'assets/product_1.jpg',
        name: 'Monitor UltraWide',
        price: 350.0,
        quantity: 1,
      ),
    ];

    cartItems.addAll(initialProducts);
    _updateTotal();
  }

  // Agregar un elemento al carrito
  void addItem(CartItem item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.name == item.name);
    if (index != -1) {
      cartItems[index].quantity += item.quantity;
    } else {
      cartItems.add(item);
    }
    _updateTotal();
  }

  // Eliminar un elemento del carrito
  void removeItem(CartItem item) {
    cartItems.remove(item);
    _updateTotal();
  }

  // Actualizar la cantidad de un elemento en el carrito
  void updateQuantity(CartItem item, int quantity) {
    int index = cartItems.indexOf(item);
    if (index != -1) {
      cartItems[index].quantity = quantity;
      _updateTotal();
    }
  }

  // Calcular el total
  void _updateTotal() {
    total.value = cartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  // Vaciar el carrito
  void clearCart() {
    cartItems.clear();
    _updateTotal();
  }

  
}

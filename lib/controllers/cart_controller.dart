import 'package:ecommerce_app/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product, int>{}.obs;
  var totalAmount = 0.0.obs;
  var isCartItemSelected = false.obs;

  void addToCart(Product product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1; // Add product with quantity 1.
    }
    // cartItems.add(product);
    // Get.showSnackbar(
    //   const GetSnackBar(
    //     message: "Added to cart",
    //     duration: Duration(seconds: 1),
    //   ),
    // );
    calculateTotal();
  }

  void removeFromCart(Product product) {
    if (cartItems.containsKey(product)) {
      if (cartItems[product]! > 1) {
        cartItems[product] = cartItems[product]! - 1; // Decrease quantity.
      } else {
        cartItems.remove(product); // Remove product if quantity is 0.
      }
    }
    calculateTotal();
    // cartItems.remove(product);
    // calculateTotal();
  }

  /// Calculate the total amount in the cart.
  void calculateTotal() {
    totalAmount.value = cartItems.entries.fold(
      0.0,
      (sum, entry) => sum + (entry.key.price * entry.value),
    );
  }

  /// Clear the entire cart.
  void clearCart() {
    cartItems.clear();
    totalAmount.value = 0.0;
  }
}

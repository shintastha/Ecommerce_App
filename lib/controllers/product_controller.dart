import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productItems = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productItems.assignAll(products);
      } else {
        print('No products found.');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }
}

import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CartPage(),
      );
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.backgroundColor,
        // leading: IconButton(
        //     onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          "My Cart",
        ),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text("Your Cart is empty"));
        }
        return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartController.cartItems.keys.toList()[index];
              final quantity = cartController.cartItems[product]!;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Slidable(
                      endActionPane:
                          ActionPane(motion: const StretchMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            cartController.removeFromCart(product);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal:
                                  20), // Add padding for better touch area
                          borderRadius: BorderRadius.circular(
                              10), // Rounded corners for the action button
                          autoClose:
                              true, // Closes automatically after performing the action
                          flex: 2,
                          icon: Icons.delete,
                        )
                      ]),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppPalette.borderColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    product.image ?? '',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: product.title.length > 25
                                            ? '${product.title.substring(0, 25)}...'
                                            : product.title,
                                        // text: cartController.cartItems[index].title,
                                        size: 18,
                                        fontWeight: FontWeight.w300,
                                        // color: AppPalette.secondaryColor,
                                        color: Colors.grey.shade700,
                                        maxline: 1,

                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      TextWidget(
                                        text: "Rs.${product.price.toString()}",
                                        size: 20,
                                        fontWeight: FontWeight.w300,
                                        color: AppPalette.primaryColor,
                                      ),
                                      const SizedBox(height: 8),

                                      // IconButton(
                                      //     onPressed: () {},
                                      //     icon: Icon(Icons.favorite_border_rounded))
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: Row(
                                    children: [
                                      ProductQuantityIcon(
                                        icon: Icons.remove,
                                        onTap: () {
                                          cartController
                                              .removeFromCart(product);
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          '$quantity',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      ProductQuantityIcon(
                                        icon: Icons.add,
                                        onTap: () {
                                          cartController.addToCart(product);
                                        },
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
      }),
    );
  }
}

class ProductQuantityIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ProductQuantityIcon({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(color: AppPalette.borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF666666),
          size: 16,
        ),
      ),
    );
  }
}

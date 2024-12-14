import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  static Route<dynamic> route(Product product) {
    return MaterialPageRoute(
      builder: (context) => ProductDetailPage(product: product),
    );
  }

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeIndex = 0;
  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppPalette.backgroundColor,
          shadowColor: AppPalette.backgroundColor,
          leading: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Row(
            children: [
              const Spacer(),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
              ),
              const SizedBox(width: 10),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  // provider.toggleFavorite(product);
                },
                icon: const Icon(
                  // provider.isExist(product)
                  Icons.favorite,
                  // : Icons.favorite_border,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ],
          )

          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: Icon(Icons.arrow_back_ios_new)),
          // title: Row(
          //   children: [
          //     Text("Detail Product"),
          //     Spacer(),
          //     IconButton(onPressed: () {}, icon: Icon(Icons.share))
          //   ],
          // ),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                height: 250,
                width: double.infinity,
                widget.product.image,
              ),
              const SizedBox(
                height: 18,
              ),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: 5,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: Colors.grey, // Inactive dot color
                    activeDotColor: AppPalette.primaryColor, // Active dot color
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextWidget(
                  text: widget.product.title,
                  size: 22,
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 6,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const TextWidget(
                  text: "Rs. ",
                  size: 20,
                  fontWeight: FontWeight.bold,
                  color: AppPalette.primaryColor,
                ),
                TextWidget(
                    text: widget.product.price.toString(),
                    size: 26,
                    color: AppPalette.primaryColor,
                    fontWeight: FontWeight.bold),
              ]),
              const SizedBox(
                height: 12,
              ),
              const TextWidget(
                textAlign: TextAlign.start,
                text: "Product Details",
                size: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              const SizedBox(height: 6),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _showFullDescription
                          ? widget.product.description
                          : "${widget.product.description.length > 100 ? widget.product.description.substring(0, 100) + '...' : widget.product.description}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    // Add See More / See Less button
                    TextSpan(
                      text: _showFullDescription ? " See Less" : " See More",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppPalette.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _showFullDescription = !_showFullDescription;
                          });
                        },
                    ),
                  ],
                ),
              ),
              // TextWidget(
              //   text: widget.product.description,
              //   size: 20,
              //   fontWeight: FontWeight.w300,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PrimaryButton(
            title: "Add to Cart",
            fontSize: 18,
            onPressed: () {
              cartController.addToCart(widget.product);
              Get.showSnackbar(
                GetSnackBar(
                  message: "Added to cart",
                  duration: const Duration(seconds: 2),
                  mainButton: TextButton(
                    onPressed: () {
                      Get.toNamed('/cart_screen');
                    },
                    child: const Text(
                      "Go to Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';

class ProductItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductItemCard({Key? key, required this.product, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppPalette.secondaryColor),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    product
                        .image, // Replace with your Product's image URL property
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.scaleDown,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.broken_image,
                          size: 50, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                    maxline: 2,
                    overflow: TextOverflow.ellipsis,
                    text: product.title,
                    size: 16,
                    fontWeight: FontWeight.w500),
                const SizedBox(
                  height: 4,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const TextWidget(
                    text: "Rs. ",
                    size: 14,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.primaryColor,
                  ),
                  TextWidget(
                      text: product.price.toString(),
                      size: 18,
                      color: AppPalette.primaryColor,
                      fontWeight: FontWeight.bold),
                ]),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    TextWidget(
                        text: product.rating.rate.toString(),
                        size: 14,
                        fontWeight: FontWeight.w500)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

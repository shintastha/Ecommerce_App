// import 'package:ecommerce_app/widgets/product_quantity_icon.dart';
// import 'package:ecommerce_app/widgets/text_widget.dart';
// import 'package:flutter/widgets.dart';

// class CartItemCard extends StatefulWidget {
//   const CartItemCard({super.key});

//   @override
//   State<CartItemCard> createState() => _CartItemCardState();
// }

// class _CartItemCardState extends State<CartItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           color: const Color(
//                                               0xFFFFFFFF,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(8)),
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal:
//                                                  20,
//                                             vertical:
//                                                 10),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                   child: Image.asset(
//                                                     cartItems[index].image,
//                                                     height:  80,
//                                                     width: 80,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 25,
//                                                 ),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     TextWidget(
//                                                         text: cartItems[index].productName,
//                                                         size:  18,
//                                                         fontWeight:
//                                                             FontWeight.w700),
//                                                     TextWidget(
//                                                       text: cartItems[index].businessName,
//                                                       size: 14,
//                                                       fontWeight: FontWeight.w500,
//                                                       color: const Color(
//                                                           0xFF666666),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),

//                                             const SizedBox(
//                                               width: 40,
//                                             ),
//                                             // const Spacer(),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               // crossAxisAlignment: CrossAxisAlignment.center,
//                                               children: [
//                                                 TextWidget(
//                                                   text:
//                                                       "NRs. ${cartItems[index].productPrice}",
//                                                   size:  14,
//                                                   fontWeight: FontWeight.w500,
//                                                   color:
//                                                       const Color(0xFF666666),
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 20,
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     ProductQuantityIcon(
//                                                         icon: Icon(Icons.remove),
//                                                         onTap: () {
//                                                           if (cartItems[index]
//                                                                   .quantity >
//                                                               1) {
//                                                             setState(() {
//                                                               cartItems[index]
//                                                                   .quantity--;
//                                                               boxCart.putAt(
//                                                                   index,
//                                                                   cartItems[
//                                                                       index]);
//                                                             });
//                                                           }
//                                                         }),
//                                                     const SizedBox(
//                                                       width: 8,
//                                                     ),
//                                                     Text(cartItems[index]
//                                                         .quantity
//                                                         .toString()),
//                                                     const SizedBox(
//                                                       width: 8,
//                                                     ),
//                                                     ProductQuantityIcon(
//                                                         icon: Icons.add,
//                                                         onTap: () {
//                                                           if (cartItems[index]
//                                                                   .quantity >
//                                                               0) {
//                                                             setState(() {
//                                                               cartItems[index]
//                                                                   .quantity++;
//                                                               boxCart.putAt(
//                                                                   index,
//                                                                   cartItems[
//                                                                       index]);
//                                                             });
//                                                           }
//                                                         }),
//                                                     SizedBox(
//                                                       width: screenWidth > 570
//                                                           ? 12
//                                                           : 4,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 20,
//                                                 ),
//                                                 IconButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         // finalList.removeAt(index);
//                                                         //  boxCart.deleteAt(index);
//                                                         delete(
//                                                             cartItems[index]);
//                                                       });
//                                                     },
//                                                     icon: Container(
//                                                         height: 40,
//                                                         width: 40,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: const Color(
//                                                               0xFFD3B6B6),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(12),
//                                                         ),
//                                                         child: const Icon(
//                                                           Icons
//                                                               .delete_forever_outlined,
//                                                           color: Colors.red,
//                                                           size: 24,
//                                                         ))),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     if (cartItems[index].isProductHiveSelected)
//                                       const Positioned(
//                                           top: 8,
//                                           right: 8,
//                                           child: Icon(
//                                             Icons.check_box_sharp,
//                                             color: Colors.green,
//                                           ))
//                                   ]), ;
//   }
// }
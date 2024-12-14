import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/views/product_detail_page.dart';
import 'package:ecommerce_app/widgets/category_tabbar.dart';
import 'package:ecommerce_app/widgets/image_slider.dart';
import 'package:ecommerce_app/widgets/product_item_card.dart';
import 'package:ecommerce_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => HomePage(),
      );

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentSlider = 0;
  int selectedIndex = 0;
  late TabController _tabController;
  final ProductController productController = Get.put(ProductController());
  final List<String> categories = [
    "All",
    "Men",
    "Women",
    "Jewelry",
    "Electronics",
    "Shoes"
  ];

  @override
  void initState() {
    super.initState();
    // Initialize TabController with the number of categories
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the TabController to avoid memory leaks
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppPalette.backgroundColor,
              surfaceTintColor: AppPalette.backgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.toNamed('/cart_screen');
                    },
                    icon: const Icon(Icons.shopping_cart_outlined))
              ],
            ),
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        backgroundColor: AppPalette.backgroundColor,
                        pinned: true,
                        floating: true,
                        expandedHeight: 340,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Padding(
                          padding: const EdgeInsets.all(14),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              const MySearchBar(),
                              const SizedBox(
                                height: 20,
                              ),
                              ImageSlider(
                                currentSlide: currentSlider,
                                onChange: (value) {
                                  setState(
                                    () {
                                      currentSlider = value;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        bottom: CategoryTabbar(
                            tabs: categories
                                .map((category) => Tab(child: Text(category)))
                                .toList(),
                            controller: _tabController))
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppPalette.primaryColor,
                      ));
                    }
                    if (productController.productItems.isEmpty) {
                      return const Center(
                        child: Text('No products available.'),
                      );
                    }

                    return TabBarView(
                      controller: _tabController,
                      children: [
                        // "All" tab
                        _buildProductGrid(productController.productItems),

                        // "Men" tab
                        _buildProductGrid(
                            productController.productItems.where((product) {
                          return product.category == Category.MEN_S_CLOTHING;
                        }).toList()),

                        // "Women" tab
                        _buildProductGrid(
                            productController.productItems.where((product) {
                          return product.category == Category.WOMEN_S_CLOTHING;
                        }).toList()),

                        // "Jewelry" tab
                        _buildProductGrid(
                            productController.productItems.where((product) {
                          return product.category == Category.JEWELERY;
                        }).toList()),

                        // "Electronics" tab
                        _buildProductGrid(
                            productController.productItems.where((product) {
                          return product.category == Category.ELECTRONICS;
                        }).toList()),

                        // "Shoes" tab
                        _buildProductGrid(
                            productController.productItems.where((product) {
                          return product.category == Category.ELECTRONICS;
                        }).toList()),
                      ],
                    );

                    // switch (_tabController.index) {
                    //   case 1: // "Men"
                    //     filteredProducts =
                    //         productController.productItems.where((product) {
                    //       return product.category == Category.MEN_S_CLOTHING;
                    //     }).toList();
                    //     break;
                    //   case 2: // "Women"
                    //     filteredProducts =
                    //         productController.productItems.where((product) {
                    //       return product.category == Category.WOMEN_S_CLOTHING;
                    //     }).toList();
                    //     break;
                    //   case 3: // "Jewelry"
                    //     filteredProducts =
                    //         productController.productItems.where((product) {
                    //       return product.category == Category.JEWELERY;
                    //     }).toList();
                    //     break;
                    //   case 4: // "Electronics"
                    //     filteredProducts =
                    //         productController.productItems.where((product) {
                    //       return product.category == Category.ELECTRONICS;
                    //     }).toList();
                    //     break;
                    //   case 5: // "Shoes"
                    //     filteredProducts =
                    //         productController.productItems.where((product) {
                    //       return product.category == Category.ELECTRONICS;
                    //     }).toList();
                    //     break;
                    //   default: // "All"
                    //     break;
                    // }
                    // return MasonryGridView.extent(
                    //     itemCount: filteredProducts.length,
                    //     shrinkWrap: true,
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     mainAxisSpacing: 10,
                    //     crossAxisSpacing: 10,
                    //     maxCrossAxisExtent: 200,
                    //     itemBuilder: (context, index) {
                    //       return ProductItemCard(
                    //           onTap: () {
                    //             // Get.toNamed('/')
                    //             Navigator.push(
                    //                 context,
                    //                 ProductDetailPage.route(
                    //                     filteredProducts[index]));
                    //           },
                    //           product: filteredProducts[index]);
                    //     });
                  }),
                ))),
      ),
    );
  }
}

// Helper function to build the product grid
Widget _buildProductGrid(List<Product> products) {
  return MasonryGridView.extent(
    itemCount: products.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    maxCrossAxisExtent: 200,
    itemBuilder: (context, index) {
      return ProductItemCard(
        onTap: () {
          Navigator.push(
            context,
            ProductDetailPage.route(products[index]),
          );
        },
        product: products[index],
      );
    },
  );
}

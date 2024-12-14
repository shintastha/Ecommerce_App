import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:ecommerce_app/views/bottom_navigation.dart';
import 'package:ecommerce_app/views/cart_page.dart';
import 'package:ecommerce_app/views/first_screen.dart';
import 'package:ecommerce_app/views/home_page.dart';
import 'package:ecommerce_app/views/profile_page.dart';
import 'package:ecommerce_app/views/search_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.authScreen,
          page: () => const FirstScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),

         GetPage(
          name: RouteName.bottomNavigation,
          page: () => const BottomNavigation(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),

         GetPage(
          name: RouteName.homeScreen,
          page: () => HomePage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),

         GetPage(
          name: RouteName.searchScreen,
          page: () => const SearchPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),

         GetPage(
          name: RouteName.cartScreen,
          page: () => const CartPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
         GetPage(
          name: RouteName.profileScreen,
          page: () => const ProfilePage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        // GetPage(
        //   name: RouteName.productDetailPage,
        //   page: () => ProductDetailPage(product: product),
        //   transition: Transition.leftToRightWithFade,
        //   transitionDuration: const Duration(milliseconds: 250),
        // ),
      ];
}

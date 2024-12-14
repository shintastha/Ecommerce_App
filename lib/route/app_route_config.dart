import 'package:ecommerce_app/views/cart_page.dart';
import 'package:ecommerce_app/views/home_page.dart';
import 'package:ecommerce_app/views/profile_page.dart';
import 'package:ecommerce_app/views/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          name: 'home',
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(
              child: HomePage(),
            );
          }),
      GoRoute(
          name: 'search',
          path: '/search',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SearchPage(),
            );
          }),
      GoRoute(
          name: 'cart',
          path: '/cart',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: CartPage(),
            );
          }),
      GoRoute(
          name: 'profile',
          path: '/profile',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ProfilePage(),
            );
          }),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(child: Text('Page not found')),
      );
    },
  );
}

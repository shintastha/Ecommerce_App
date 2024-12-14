import 'package:ecommerce_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SearchPage(),
      );
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: MySearchBar(),
        ),
      ),
    );
  }
}

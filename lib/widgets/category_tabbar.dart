import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CategoryTabbar extends StatefulWidget implements PreferredSizeWidget {
  final TabController controller;

  final List<Widget> tabs;
  const CategoryTabbar({
    super.key,
    required this.tabs,
    required this.controller,
  });

  @override
  State<CategoryTabbar> createState() => _CategoryTabbarState();

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class _CategoryTabbarState extends State<CategoryTabbar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPalette.backgroundColor,
      child: TabBar(
        controller: widget.controller,
        overlayColor: const WidgetStatePropertyAll(AppPalette.transparentColor),
        tabs: widget.tabs,
        indicatorPadding: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        dividerColor: AppPalette.transparentColor,
        isScrollable: true,
        indicatorColor: AppPalette.primaryColor,
        unselectedLabelColor: AppPalette.secondaryColor,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        labelColor: AppPalette.primaryColor,
        tabAlignment: TabAlignment.start,
      ),
    );
  }
}

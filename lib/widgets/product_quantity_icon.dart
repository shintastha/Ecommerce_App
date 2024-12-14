import 'package:flutter/material.dart';

class ProductQuantityIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

 ProductQuantityIcon({
    Key? key,
    required this.icon,
    required this.onTap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          color: const Color(0xFF666666),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFFFFFFF),
          size: 16,
        ),
      ),
    );
  }
}



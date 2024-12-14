import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final Color? color;
  final TextAlign? textAlign;
  final double? size;
  final int? maxline;
  final String? text;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final String fFamily;
  const TextWidget(
      {this.maxline,
      required this.text,
      this.color = Colors.black,
      required this.size,
      required this.fontWeight,
      super.key,
      this.fFamily = "Inter",
      this.textAlign,
      this.decoration,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxline,
      text!,
      softWrap: true,
      textAlign: textAlign,
      overflow: overflow,
      textScaler: TextScaler.noScaling,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color,
        decoration: decoration,
        fontFamily: fFamily,
      ),
    );
  }
}

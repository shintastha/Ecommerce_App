import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Icon? icon;
  final double? horizontalIconSpace;
  final EdgeInsets? padding;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;

  const PrimaryButton({
    super.key,
    required this.title,
    this.textColor,
    this.color,
    required this.onPressed,
    this.fontSize,
    this.horizontalIconSpace = 4,
    this.fontWeight,
    this.icon,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
        ),
        backgroundColor: color ?? AppPalette.buttonColor,
        foregroundColor: textColor ?? Colors.white,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox.shrink(),
          (icon != null)
              ? SizedBox(
                  width: horizontalIconSpace ?? 12,
                )
              : const SizedBox.shrink(),
          TextWidget(
            text: title!,
            size: fontSize,
            fontWeight: fontWeight ?? FontWeight.w600,
            fFamily: "DM-Sans",
            color: textColor ?? Colors.white,
          ),
        ],
      ),
    );
  }
}


// import 'package:ecommerce_app/core/theme/app_pallete.dart';
// import 'package:flutter/material.dart';

// class Button extends StatelessWidget {
//   final String buttonText;
//   final VoidCallback onPressed;
//   const Button({
//     super.key,
//     required this.buttonText,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppPalette.buttonColor,
//         borderRadius: BorderRadius.circular(7),
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           fixedSize: const Size(395, 45),
//           backgroundColor: AppPalette.transparentColor,
//           shadowColor: AppPalette.transparentColor,
//         ),
//         child: Text(
//           buttonText,
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w600,
//             color: AppPalette.backgroundColor,
//           ),
//         ),
//       ),
//     );
//   }
// }

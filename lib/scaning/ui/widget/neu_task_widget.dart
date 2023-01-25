import 'package:flutter/material.dart';
import 'package:scaning/scaning/ui/screens/home.dart';

class NeuTaskWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  const NeuTaskWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.padding,
    this.color,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? boxColor,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: -const Offset(3, 3),
              color: Colors.white,
            ),
            const BoxShadow(
              blurRadius: 8,
              offset: Offset(5, 8),
              color: Color.fromRGBO(214, 223, 230, 1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

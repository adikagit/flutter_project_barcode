import 'package:flutter/material.dart';
import 'package:scaning/scaning/ui/screens/home.dart';

class NeuContainerWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  const NeuContainerWidget(
      {super.key,
      this.padding,
      this.color,
      this.borderRadius,
      this.width,
      this.height,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: child,
      ),
    );
  }
}

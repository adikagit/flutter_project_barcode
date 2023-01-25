import 'package:flutter/material.dart';
import 'package:scaning/scaning/ui/screens/home.dart';

class NeuButton extends StatefulWidget {
  final String title;
  final VoidCallback onTab;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  const NeuButton({
    Key? key,
    required this.title,
    required this.onTab,
    this.padding,
    this.color,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  void _onPointerDown() {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
    widget.onTab.call();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        _onPointerDown();
      },
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.color ?? boxColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          boxShadow: _isPressed
              ? null
              : [
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
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 23),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

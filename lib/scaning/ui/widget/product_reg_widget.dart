import 'package:flutter/material.dart';
import 'package:scaning/scaning/ui/screens/home.dart';
import 'package:scaning/scaning/ui/widget/neu_button.dart';
import 'package:scaning/scaning/ui/widget/neu_container.dart';

class ProductRegWidget extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final int number;
  final VoidCallback onTapSave;
  final VoidCallback onTapBack;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  const ProductRegWidget({
    Key? key,
    required this.hint,
    required this.controller,
    required this.number,
    required this.onTapSave,
    required this.onTapBack,
    this.color,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          NeuContainerWidget(
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 20),
              autofocus: true,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                  ),
                  border: InputBorder.none,
                  fillColor: black),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          NeuContainerWidget(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(children: [
              const Expanded(
                  child: Text(
                'Количество',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              )),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$number',
                style: const TextStyle(fontSize: 23),
                textAlign: TextAlign.left,
              )
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          NeuButton(
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 18),
              title: 'Сохранить',
              color: boxColor2,
              onTab: onTapSave),
          const SizedBox(
            height: 20,
          ),
          NeuButton(
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 15),
              title: 'Назад',
              color: red,
              onTab: onTapBack),
        ],
      ),
    );
  }
}

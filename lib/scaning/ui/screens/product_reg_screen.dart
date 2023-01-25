import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaning/scaning/logic/controllers/task_controllers.dart';
import 'package:scaning/scaning/logic/models/task.dart';
import 'package:scaning/scaning/ui/screens/home.dart';
import 'package:scaning/scaning/ui/widget/product_reg_widget.dart';

class ProductRegScreen extends StatefulWidget {
  final int? number;
  const ProductRegScreen({
    super.key, required this.number,
  });

  @override
  State<ProductRegScreen> createState() => _ProductRegScreenState();
}

class _ProductRegScreenState extends State<ProductRegScreen> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: boxColor,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 16,right: 16, top: 30),
            child: ProductRegWidget(
              hint: 'Введите наименование товара',
              controller: _textEditingController,
              number: widget.number ?? 0,
              onTapSave: _validateDate,
              onTapBack: () => Get.back(),
            ),
          ),
        ));
  }

  _validateDate() {
    if (_textEditingController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
      Get.snackbar("Добавлено",
          "Перейдите в иторию товаров,\nдля просмотра добавленного товара",
          margin: const EdgeInsets.all(16),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green[100],
          colorText: Colors.black87,
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ));
    } else if (_textEditingController.text.isEmpty ||
        _textEditingController.text == '\n') {
      Get.snackbar("Ошибка", "Введите название товара",
          margin: const EdgeInsets.all(16),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
          colorText: Colors.black87,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  _addTaskToDb() async {
    _taskController.addTask(
        task: Task(
      name: _textEditingController.text.replaceAll('\n', ''),
      number: widget.number ?? 0,
    ));
  }
}

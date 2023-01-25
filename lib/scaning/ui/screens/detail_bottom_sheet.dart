import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scaning/scaning/logic/controllers/task_controllers.dart';
import 'package:scaning/scaning/ui/screens/home.dart';
import 'package:scaning/scaning/ui/widget/neu_button.dart';

class DetailBottomSheet extends StatelessWidget {
  final String? name;
  final int? number;
  final int? deleteTask;
  DetailBottomSheet({
    Key? key,
    this.name,
    this.number,
    this.deleteTask,
  }) : super(key: key);

  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Наименование товара:',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        name ?? '',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Количество товара:',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${number ?? 0}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  NeuButton(
                      width: double.infinity,
                      title: 'Удалить',
                      color: red,
                      onTab: () {
                        _taskController
                            .delete(_taskController.taskList[deleteTask ?? 0]);
                        _taskController.getTask();
                        Get.back();
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

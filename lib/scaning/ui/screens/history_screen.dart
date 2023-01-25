import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaning/scaning/logic/controllers/task_controllers.dart';
import 'package:scaning/scaning/logic/models/task.dart';
import 'package:scaning/scaning/ui/screens/detail_bottom_sheet.dart';
import 'package:scaning/scaning/ui/screens/home.dart';
import 'package:scaning/scaning/ui/widget/neu_button.dart';
import 'package:scaning/scaning/ui/widget/neu_task_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _taskController = Get.put(TaskController());
  late ScrollController _controller;
  late int taskLimitCount;

  @override
  void initState() {
    super.initState();
    taskLimitCount = 0;
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boxColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: boxColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.grey),
        ),
        title: const Text(
          "История товаров",
          style: TextStyle(fontSize: 25, color: Colors.black54),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Вы действительно хотите все удалить?'),
                      actions: [
                        Expanded(
                          child: NeuButton(
                              title: 'Да',
                              color: boxColor2,
                              onTab: () {
                                _taskController.deleteAll();
                                Get.back();
                                Get.back();
                                Get.snackbar("Успешно",
                                    "Удалены все данные по товарам",
                                    margin: const EdgeInsets.all(16),
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green[100],
                                    colorText: Colors.black87,
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ));
                              }),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: NeuButton(
                            title: 'Нет',
                            color: red,
                            onTab: () => Get.back(),
                          ),
                        ),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.delete_forever_outlined, color: Colors.black54),
          )
        ],
        centerTitle: true,
      ),
      body: Obx(() {
        if (_taskController.taskList.isEmpty) {
          return Container(
            child: Center(
                child: Text(
              'Нет товара)',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: black.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            )).paddingOnly(bottom: 70),
          );
        } else {
          return ListView.builder(
            controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: _taskController.taskList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Task task = _taskController.taskList[index];
              return Container(
                key: ValueKey(task),
                padding: EdgeInsets.only(
                    right: 16,
                    left: 16,
                    top: 16,
                    bottom: index == _taskController.taskList.length - 1
                        ? 100
                        : 14),
                child: NeuTaskWidget(
                  title: task.name ?? '',
                  onTap: () {
                    setState(() {
                      showCupertinoModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (_) {
                          return Wrap(children: [
                            DetailBottomSheet(
                              name: task.name ?? '',
                              number: task.number ?? 0,
                              deleteTask: index,
                            )
                          ]);
                        },
                      );
                    });
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}

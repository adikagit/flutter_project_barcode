import 'package:get/get.dart';
import 'package:scaning/scaning/logic/db/db_helper.dart';
import 'package:scaning/scaning/logic/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTask();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delete(task);
  }

  void deleteAll() {
    DBHelper.deleteAll();
  }
}

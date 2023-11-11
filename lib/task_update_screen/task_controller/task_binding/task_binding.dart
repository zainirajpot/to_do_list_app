import 'package:get/get.dart';
import 'package:to_do_list_app/task_update_screen/task_controller/task_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
  }
}

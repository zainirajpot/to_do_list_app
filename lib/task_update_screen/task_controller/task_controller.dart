import 'package:get/get.dart';
import 'package:to_do_list_app/data_base/db_helper.dart';
import 'package:to_do_list_app/models_db/task_db.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int>? addTask({TaskDb? task}) async {
    return await DBHelper.insert(task);
  }
}

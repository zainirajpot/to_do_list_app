import 'package:get/get.dart';
import 'package:to_do_list_app/home_page/home_controller/home_controller.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController(
    ));
  }
}
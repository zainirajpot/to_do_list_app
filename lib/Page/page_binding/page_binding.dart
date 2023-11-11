import 'package:get/get.dart';
import 'package:to_do_list_app/Page/page_controller/page_controller.dart';

class PageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageViewController>(() => PageViewController());
  }
}





import 'package:get/get.dart';
import 'package:to_do_list_app/login/login_controller/login_controller.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginViewController>(() => LoginViewController(
  ));
  }
}
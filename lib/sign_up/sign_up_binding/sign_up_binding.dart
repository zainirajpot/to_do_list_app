import 'package:get/get.dart';
import 'package:to_do_list_app/sign_up/sign_up_controller/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}

import 'package:get/get.dart';

class PageViewController extends GetxController {
  var currentPageIndex = 0.obs;

  void setPageIndex(int index) {
    currentPageIndex.value = index;
  }
}
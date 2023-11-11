import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/Page/page_controller/page_controller.dart';
import 'package:to_do_list_app/Page/page_screens/goals_screen.dart';
import 'package:to_do_list_app/Page/page_screens/page_screen.dart';
import 'package:to_do_list_app/comman/app_assets.dart';
import 'package:to_do_list_app/comman/app_content.dart';
import 'package:to_do_list_app/login/login_controller/login_binding/login_binding.dart';
import 'package:to_do_list_app/login/login_view/login_view.dart';

class PageScreen extends GetView<PageViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: PageController(initialPage: 0),
              onPageChanged: (index) {
                controller.setPageIndex(index);
              },
              children: [
                PageScreens(
                  buttonLabel: AppContent.skip,
                  description: AppContent.smallApp,
                  imagePath: AppAssets.taskImage,
                  title: AppContent.manage,
                  onButtonPressed: () {
                    Get.to(() => LoginView(), binding: LoginBinding());
                  },
                ),
                PageScreens(
                    buttonLabel: AppContent.skip,
                    description: AppContent.task,
                    imagePath: AppAssets.planImage,
                    onButtonPressed: () {
                      Get.to(() => LoginView(), binding: LoginBinding());
                    },
                    title: AppContent.day),
                // PageScreensScnd(
                //     description: true,
                //     imagePath:true,
                //     onButtonPressed: () {PageScreensScnd()},
                //     title: true,
                //     buttonLabel: true),
                GoalsScreen(),
                // PageScreens(
                //     description: AppContent.track,
                //     imagePath: AppAssets.goalsImage,

                //     title: AppContent.goals),
              ],
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                3,
                (int index) {
                  return GestureDetector(
                    onTap: () {
                      controller.setPageIndex(index);
                    },
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == controller.currentPageIndex.value
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

// class MyPageView extends StatelessWidget {
//   final PageViewController pageController = Get.put(PageViewController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView(
//               controller: PageController(initialPage: 0),
//               onPageChanged: (index) {
//                 pageController.setPageIndex(index);
//               },
//               children: [
//                 Screen1(),
//                 Screen2(),
//                 Screen3(),
//               ],
//             ),
//           ),
//           Obx(() {
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List<Widget>.generate(
//                 3,
//                 (int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       pageController.setPageIndex(index);
//                     },
//                     child: Container(
//                       width: 10.0,
//                       height: 10.0,
//                       margin: EdgeInsets.symmetric(horizontal: 5.0),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: index == pageController.currentPageIndex.value
//                             ? Colors.blue
//                             : Colors.grey,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }


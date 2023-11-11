import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:to_do_list_app/Page/page_binding/page_binding.dart';
import 'package:to_do_list_app/Page/page_view/page_view.dart';
import 'package:to_do_list_app/data_base/db_helper.dart';
import 'package:to_do_list_app/firebase_options.dart';
import 'package:to_do_list_app/sign_up/sign_up_controller/sign_up_controller.dart';

void main() async {
  Get.put(SignUpController());
  await DBHelper.intiDB();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ToDoApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: PageScreen(),
      initialBinding: PageBinding(),
    // home: HomeView(),
      
      // home: FutureBuilder<User?>(
      //   future: _auth.authStateChanges().first,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       // Return a loading screen if the authentication state is still loading.
      //       return CircularProgressIndicator();
      //     } else {
      //       if (snapshot.hasData && snapshot.data!.emailVerified) {
      //         // User is logged in and email is verified, show the content.
      //         return HomeView();
      //       } else {
      //         // User is not logged in or email is not verified, navigate to the login screen.
      //         return SignUpView();
      //       }
      //     }
      //   },
      // ),
    );
  }
}







// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'ToDoApp',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       //  home:  LoginView(),
// // home: TaskUpdateScreen(),
//       // home:TimeInputScreen(),
//       // home: MyHomePage(title: 'homepage',),
//       home: PageScreen(),
//       // home: SignupView(),
//       initialBinding: PageBinding(),
//     );
//   }
// }

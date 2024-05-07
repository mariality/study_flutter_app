import 'package:get/get.dart';
//import 'package:quizzle/controllers/controllers.dart';
//import 'package:quizzle/services/services.dart';

import '../controllers/auth_controller.dart';
import '../controllers/common/theme_controller.dart';
import '../services/firebase/firebasestorage_service.dart';
import '../services/notification/notification_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    Get.put(NotificationService());
    Get.lazyPut(() =>  FirebaseStorageService());
  }
}

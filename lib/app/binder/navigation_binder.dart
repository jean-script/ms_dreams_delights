import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/controllers/navigation_controller.dart';

class NavigationBinder implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);
  }
}

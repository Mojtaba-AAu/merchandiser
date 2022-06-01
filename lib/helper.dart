import 'package:get/get.dart';
import 'package:merchandiser/Controller/report_controller.dart';
import 'package:merchandiser/Controller/user_controller.dart';


class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(()=> ReportsController());
  }

}
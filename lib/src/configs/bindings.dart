import 'package:get/get.dart';

class InitialBindings extends Bindings {
  InitialBindings._() {
    dependencies();
  }

  factory InitialBindings() => InitialBindings._();

  @override
  void dependencies() {
    // Get.lazyPut(() => );
  }
}

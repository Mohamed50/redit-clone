import 'package:get/get.dart';
import 'package:reddit_clone_flutter/modules/post/post_controller.dart';
import 'package:reddit_clone_flutter/modules/post/post_services.dart';

class PostBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostServices());
    Get.lazyPut(() => PostController(postServices: Get.find<PostServices>()));
  }
}

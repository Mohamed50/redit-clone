import 'package:get/get.dart';
import 'package:reddit_clone_flutter/core/router/app_routes.dart';
import 'package:reddit_clone_flutter/modules/post/post_bindings.dart';
import 'package:reddit_clone_flutter/modules/post/post_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.post,
      page: () => PostPage(),
      binding: PostBindings(),
    )
  ];
}

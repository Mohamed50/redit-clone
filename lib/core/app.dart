import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reddit_clone_flutter/core/router/app_pages.dart';
import 'package:reddit_clone_flutter/modules/post/post_bindings.dart';
import 'package:reddit_clone_flutter/modules/post/post_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit Clone',
      getPages: AppPages.pages,
      initialBinding: PostBindings(),
      home: PostPage(),
    );
  }
}

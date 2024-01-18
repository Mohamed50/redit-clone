import 'dart:developer';

import 'package:get/get.dart';
import 'package:reddit_clone_flutter/modules/post/post_controller.dart';

class PostActions {
  static openCommentsPressed() {}

  static pauseVideo() {
    Get.find<PostController>().videoPlayerController.pause();
  }

  static playVideo() {
    Get.find<PostController>().videoPlayerController.play();
  }

  static muteVideo() {
    Get.find<PostController>().videoPlayerController.setVolume(0);
  }

  static unMuteVideo() {
    Get.find<PostController>().videoPlayerController.setVolume(1);
  }

  static upVotePost() {
    Get.find<PostController>().upVotePost();
  }

  static downVotePost() {
    Get.find<PostController>().downVotePost();
  }

  static upVoteComment(String id) {
    Get.find<PostController>().upVoteComment(id);
  }

  static downVoteComment(String id) {
    Get.find<PostController>().downVoteComment(id);
  }
}

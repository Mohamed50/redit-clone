
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reddit_clone_flutter/modules/post/post_controller.dart';
import 'package:reddit_clone_flutter/modules/post/views/video_settings_overlay.dart';
import 'package:video_player/video_player.dart';

class PostPage extends GetWidget<PostController> {
  final RxBool isSettingsOverlayOpen = true.obs;

  PostPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            //isSettingsOverlayOpen.value = !isSettingsOverlayOpen.value;
          },
          child: Stack(
            children: [
              Center(
                child: GetBuilder<PostController>(
                  builder:(controller) => AspectRatio(
                    aspectRatio:
                        controller.videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(
                      controller.videoPlayerController,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: isSettingsOverlayOpen.value,
                  child: VideoSettingsOverlay(
                    postModel: controller.post,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

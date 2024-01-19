import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reddit_clone_flutter/modules/post/models/post_model.dart';
import 'package:reddit_clone_flutter/modules/post/post_controller.dart';
import 'package:reddit_clone_flutter/modules/post/widgets/video_engagement_view.dart';
import 'package:reddit_clone_flutter/modules/post/widgets/video_settings_header.dart';
import '../widgets/video_details_view.dart';

class VideoSettingsOverlay extends GetView<PostController> {
  const VideoSettingsOverlay({super.key, required this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            VideoSettingsHeader(channelName: postModel.channelName, channelImageUrl: postModel.channelPic),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: VideoDetailsView(
                    username: postModel.userName,
                    userPicUrl: postModel.userProfilePic,
                    postDesc: postModel.description,
                  ),
                ),
                VideoEngagementView(
                  comments: postModel.comments,
                  postDesc: postModel.description,
                  username: postModel.userName,
                  userProfilePic: postModel.userProfilePic,
                  numberOfVotes: postModel.numberOfVotes.toString(),
                  numberOfComments: postModel.numberOfComments.toString(),
                ),
              ],
            ),
            const SettingsFooter(),
          ],
        ),
      ),
    );
  }
}

class SettingsFooter extends GetView<PostController> {
  const SettingsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.isPlaying.value ? controller.pause() : controller.play();
              },
              child: FaIcon(
                controller.isPlaying.value ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Slider(
                min: 0,
                max: controller.videoPlayerController.value.duration.inSeconds.toDouble(),
                value: controller.sliderValue.value,
                activeColor: Colors.white,
                inactiveColor: Colors.blueGrey,
                onChanged: controller.onSliderValueChange,
              ),
            ),
            Text(
              controller.currentVideoTime.value,
              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 16.0),
            InkWell(
              onTap: controller.handleVolume,
              child: FaIcon(
                !controller.isMuted.value ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeXmark,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reddit_clone_flutter/core/utils.dart';
import 'package:reddit_clone_flutter/modules/post/models/post_model.dart';
import 'package:reddit_clone_flutter/modules/post/widgets/video_engagement_view.dart';
import 'package:reddit_clone_flutter/modules/post/widgets/video_settings_header.dart';
import 'package:video_player/video_player.dart';

import '../widgets/video_details_view.dart';

class VideoSettingsOverlay extends StatelessWidget {
  VideoSettingsOverlay({
    super.key,
    required this.controller,
    required this.postModel,
  }) {
    startControllerListener();
  }
  final VideoPlayerController controller;
  final PostModel postModel;

  Rx<double> sliderValue = 0.0.obs;
  RxString currentVideoTime = '00:00'.obs;
  RxBool isPlaying = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Padding(
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
              _controlSettingsFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Row _controlSettingsFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            isPlaying.value ? controller.pause() : controller.play();
          },
          icon: Icon(
            isPlaying.value ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Slider(
              min: 0,
              max: 100,
              value: sliderValue.value,
              activeColor: Colors.white,
              inactiveColor: Colors.blueGrey,
              onChanged: (_) {},
            ),
            Text(
              currentVideoTime.value,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            controller.setVolume(controller.value.volume == 0 ? 1 : 0);
          },
          icon: FaIcon(
            controller.value.volume == 0 ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeXmark,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  startControllerListener() {
    controller.addListener(() {
      isPlaying.value = controller.value.isPlaying;
      currentVideoTime.value = Utils.durationToTime(controller.value.position);
      sliderValue.value = Utils.durationPercentage(controller.value.duration, controller.value.position);
      if (sliderValue.value.isNaN) {
        sliderValue.value = 0;
      }
    });
  }
}

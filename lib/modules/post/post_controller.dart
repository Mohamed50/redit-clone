import 'dart:developer';

import 'package:get/get.dart';
import 'package:reddit_clone_flutter/core/enums.dart';
import 'package:reddit_clone_flutter/core/utils.dart';
import 'package:reddit_clone_flutter/modules/post/models/comment_model.dart';
import 'package:reddit_clone_flutter/modules/post/models/post_model.dart';
import 'package:reddit_clone_flutter/modules/post/post_services.dart';
import 'package:video_player/video_player.dart';

import '../../core/models/user.dart';

class PostController extends GetxController {
  PostController({required this.postServices}) {
    post = postServices.getPostData('0');
    currentUser = User(id: '1', name: 'CurrentUser');
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(post.videoUrl));
    videoPlayerController.initialize().then((value) {
      update();
    });
    videoPlayerController.play();
    startControllerListener();
  }

  final PostServices postServices;

  late VideoPlayerController videoPlayerController;

  late PostModel post;

  late User currentUser;

  RxBool isVideoPlaying = false.obs;

  Rx<double> sliderValue = 0.0.obs;
  RxString currentVideoTime = '00:00'.obs;
  RxBool isPlaying = false.obs;
  RxBool isMuted = false.obs;
  RxBool isCommentTyping = false.obs;

  @override
  onInit() {
    super.onInit();
    post = postServices.getPostData('0');
  }

  upVotePost() {
    if (post.voteType != VoteTypeEnum.upVote) {
      if (postServices.upVotePost(post.id)) {
        post.numberOfVotes = post.numberOfVotes + 1;
        post.voteType = post.voteType == VoteTypeEnum.downVote ? VoteTypeEnum.none : VoteTypeEnum.upVote;
      } else {
        throw Exception('Failed');
      }
    }
  }

  downVotePost() {
    if (post.voteType != VoteTypeEnum.downVote) {
      if (postServices.downVotePost(post.id)) {
        post.numberOfVotes = post.numberOfVotes - 1;
        post.voteType = post.voteType == VoteTypeEnum.upVote ? VoteTypeEnum.none : VoteTypeEnum.downVote;
      } else {
        throw Exception('Failed');
      }
    }
  }

  upVoteComment(String id) {
    log('from controller');
    CommentModel comment = post.comments.firstWhere((element) => element.id == id);
    log(comment.content);
    log(comment.voteType.toString());
    if (comment.voteType != VoteTypeEnum.upVote) {
      if (postServices.upVoteComment(id)) {
        comment.numberOfVotes = comment.numberOfVotes + 1;
        comment.voteType = comment.voteType == VoteTypeEnum.downVote ? VoteTypeEnum.none : VoteTypeEnum.upVote;
        update();
      } else {
        throw Exception('Failed');
      }
    }
  }

  downVoteComment(String id) {
    CommentModel comment = post.comments.firstWhere((element) => element.id == id);
    if (comment.voteType != VoteTypeEnum.downVote) {
      if (postServices.upVoteComment(id)) {
        comment.numberOfVotes = comment.numberOfVotes - 1;
        comment.voteType = comment.voteType == VoteTypeEnum.upVote ? VoteTypeEnum.none : VoteTypeEnum.downVote;
      } else {
        throw Exception('Failed');
      }
    }
  }

  addComment(String content) {
    post.comments.add(postServices.sendComment(currentUser.id, content));
    update();
  }

  startControllerListener() {
    videoPlayerController.addListener(() {
      isPlaying.value = videoPlayerController.value.isPlaying;
      currentVideoTime.value = Utils.durationToTime(videoPlayerController.value.position);
      sliderValue.value = videoPlayerController.value.position.inSeconds.toDouble();
    });
  }

  void seekToSecond(Duration position) {
    videoPlayerController.seekTo(position);
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }

  void pause() {
    videoPlayerController.pause();
  }

  void play() {
    videoPlayerController.play();
  }

  void handleVolume() {
    if (isMuted.value) {
      unMute();
    } else {
      mute();
    }
  }

  void mute() {
    isMuted.value = true;
    videoPlayerController.setVolume(0);
  }

  void unMute() {
    isMuted.value = false;
    videoPlayerController.setVolume(1);
  }

  void onSliderValueChange(double value) {
    log(value.toString());
    sliderValue.value = value;
    seekToSecond(Duration(seconds: value.toInt()));
  }
}

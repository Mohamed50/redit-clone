import 'dart:developer';

import 'package:get/get.dart';
import 'package:reddit_clone_flutter/core/enums.dart';
import 'package:reddit_clone_flutter/modules/post/models/comment_model.dart';
import 'package:reddit_clone_flutter/modules/post/models/post_model.dart';
import 'package:reddit_clone_flutter/modules/post/post_services.dart';
import 'package:video_player/video_player.dart';

import '../../core/models/user.dart';

class PostController extends GetxController {
  PostController({required this.postServices}) {
    post = postServices.getPostData('0');
    currentUser = User(id: '1', name: 'CurrentUser');
    videoPlayerController = VideoPlayerController.asset(post.videoUrl);
    videoPlayerController.initialize().then((value) {});
    videoPlayerController.play();
  }

  final PostServices postServices;

  late VideoPlayerController videoPlayerController;

  late PostModel post;

  late User currentUser;

  RxBool isVideoPlaying = false.obs;

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
  }
}

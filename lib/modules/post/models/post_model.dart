import 'package:reddit_clone_flutter/modules/post/models/comment_model.dart';

import '../../../core/enums.dart';

class PostModel {
  final String id;
  final String channelId;
  final String channelName;
  final String channelPic;
  final String description;
  final String videoUrl;
  int numberOfVotes;
  int numberOfComments;
  List<CommentModel> comments;
  final String userId;
  final String userName;
  final String userProfilePic;
  VoteTypeEnum voteType;

  PostModel({
    required this.id,
    required this.channelId,
    required this.channelName,
    required this.channelPic,
    required this.description,
    required this.videoUrl,
    required this.numberOfVotes,
    required this.numberOfComments,
    this.comments = const [],
    required this.userId,
    required this.userName,
    required this.userProfilePic,
    this.voteType = VoteTypeEnum.none,
  });
}


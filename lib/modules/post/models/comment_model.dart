import 'package:reddit_clone_flutter/core/enums.dart';

class CommentModel {
  final String id;
  final String content;
  final DateTime createdAt;
  final String userAvatarId;
  final String userId;
  final String username;
  int numberOfVotes;
  final bool isReply;
  final List<CommentModel> replies;
  VoteTypeEnum voteType;

  CommentModel({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.userAvatarId,
    required this.userId,
    required this.username,
    required this.numberOfVotes,
    required this.isReply,
    this.replies = const [],
    this.voteType = VoteTypeEnum.none,
  });

}

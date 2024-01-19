import 'package:reddit_clone_flutter/modules/post/dummy_data.dart';
import 'package:reddit_clone_flutter/modules/post/models/comment_model.dart';
import 'package:reddit_clone_flutter/modules/post/models/post_model.dart';

class PostServices {
  PostModel getPostData(String id) {
    return dummyPost;
  }

  bool upVotePost(String id) {
    return true;
  }

  bool downVotePost(String id) {
    return true;
  }

  bool upVoteComment(String id) {
    return true;
  }

  bool downVoteComment(String id) {
    return true;
  }

  CommentModel sendComment(String id, String comment) {
    return CommentModel(
      id: '20',
      content: comment,
      createdAt: DateTime.now(),
      userAvatarId: 'av',
      userId: id,
      username: 'Current user',
      numberOfVotes: 0,
      isReply: false,
    );
  }
}

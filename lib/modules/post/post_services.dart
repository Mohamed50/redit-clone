import 'package:reddit_clone_flutter/modules/post/dummy_data.dart';
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

}

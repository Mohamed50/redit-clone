import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reddit_clone_flutter/modules/post/models/comment_model.dart';
import 'package:reddit_clone_flutter/modules/post/post_actions.dart';
import 'package:reddit_clone_flutter/modules/post/post_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../views/comments_section.dart';

class VideoEngagementView extends StatelessWidget {
  const VideoEngagementView({
    super.key,
    required this.comments,
    required this.postDesc,
    required this.username,
    required this.userProfilePic,
    required this.numberOfVotes,
    required this.numberOfComments,
  });

  final List<CommentModel> comments;
  final String postDesc;
  final String username;
  final String userProfilePic;
  final String numberOfVotes;
  final String numberOfComments;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                PostActions.upVotePost();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal:8.0),
                child: Center(child: FaIcon(FontAwesomeIcons.arrowUpLong, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(numberOfVotes, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            InkWell(
                onTap: () {
                  PostActions.downVotePost();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.0),
                  child: FaIcon(FontAwesomeIcons.arrowDownLong, color: Colors.white),
                )),
          ],
        ),
        const SizedBox(height: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                await Get.bottomSheet(
                  CommentsSection(
                    comments: comments,
                    description: postDesc,
                    userName: username,
                    userAvatarUrl: userProfilePic,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 500),
                );
                Get.find<PostController>().isCommentTyping.value = false;
              },
              child: const FaIcon(FontAwesomeIcons.message, color: Colors.white),
            ),
            const SizedBox(height: 6.0),
            Text(numberOfComments, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
          ],
        ),
        const SizedBox(height: 16.0),
        IconButton(onPressed: () {
          Share.share(postDesc);

        }, icon: const FaIcon(FontAwesomeIcons.arrowUpFromBracket), color: Colors.white),
      ],
    );
  }
}

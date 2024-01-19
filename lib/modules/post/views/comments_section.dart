import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit_clone_flutter/modules/post/models/comment_model.dart';
import 'package:reddit_clone_flutter/modules/post/post_actions.dart';

import '../widgets/add_comment_widget.dart';
import '../widgets/comment_card.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection(
      {super.key, required this.comments, required this.description, required this.userName, required this.userAvatarUrl});

  final List<CommentModel> comments;
  final String description;
  final String userName;
  final String userAvatarUrl;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(12.0),
              width: 48.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0)
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(backgroundImage: NetworkImage(userAvatarUrl), radius: 8),
                                  const SizedBox(width: 12),
                                  Text(userName)
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(description),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.star, color: Colors.grey.shade600, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Top Comments',
                                    style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                  const SizedBox(width: 4),
                                  FaIcon(FontAwesomeIcons.chevronDown, color: Colors.grey.shade600, size: 12)
                                ],
                              )
                            ],
                          ),
                        ),
                        for (CommentModel comment in comments)
                          Column(
                            children: [
                              CommentCard(comment: comment, indentLevel: 0),
                              const SizedBox(height: 8),
                              Divider(thickness: 8.0, color: Colors.grey.shade100),
                            ],
                          ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.15,)
                      ],
                    ),
                  ),
                  AddCommentWidget(
                    replyAction: (comment) {
                      PostActions.addCommentPressed(comment);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

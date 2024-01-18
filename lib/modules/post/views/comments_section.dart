import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit_clone_flutter/modules/post/models/comment_model.dart';

import '../widgets/comment_card.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection(
      {super.key,
      required this.comments,
      required this.description,
      required this.userName,
      required this.userAvatarUrl});

  final List<CommentModel> comments;
  final String description;
  final String userName;
  final String userAvatarUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 36,
              height: 4,
              color: Colors.grey.shade200,
            ),
          ),
          const AddCommentWidget()
        ],
      ),
    );
  }
}

class AddCommentWidget extends StatelessWidget {
  const AddCommentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0.4,
              blurRadius: 2,
              offset: Offset(-0.5, 0),
            )
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Add a comment',
            filled: true,
            fillColor: Colors.grey.shade100,
            icon: FaIcon(FontAwesomeIcons.image, color: Colors.grey.shade400),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

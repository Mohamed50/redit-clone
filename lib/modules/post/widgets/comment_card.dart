import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit_clone_flutter/core/utils.dart';
import 'package:reddit_clone_flutter/modules/post/models/comment_model.dart';
import 'package:reddit_clone_flutter/modules/post/post_actions.dart';

class CommentCard extends StatelessWidget {
  final CommentModel comment;

  CommentCard({super.key, required this.comment, required this.indentLevel});

  final int indentLevel;
  final String avatarUrl = 'https://picsum.photos/id/${Random().nextInt(50)}/10';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.0, left: (indentLevel * 12.0) + 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 12.0),
              const SizedBox(width: 6.0),
              Text(comment.username),
              Text(' · ${Utils.calculateTimeDifferenceFromDateTime(comment.createdAt)}')
            ],
          ),
          const SizedBox(height: 8.0),
          Text(comment.content),
          const SizedBox(height: 8.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FaIcon(
                FontAwesomeIcons.ellipsis,
                size: 16,
                color: Colors.grey.shade500,
              ),
              const SizedBox(width: 12.0),
              Row(
                children: [
                  FaIcon(
                    Icons.reply,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    'Reply',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                width: 12.0,
              ),
              GestureDetector(
                  onTap: () {
                    PostActions.upVoteComment(comment.id);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.arrowUpLong,
                    size: 16,
                    color: Colors.grey.shade500,
                  )),
              const SizedBox(width: 6.0),
              Text(
                comment.numberOfVotes.toString(),
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 6.0,
              ),
              GestureDetector(
                onTap: () {
                  PostActions.downVoteComment(comment.id);
                },
                child: FaIcon(
                  FontAwesomeIcons.arrowDownLong,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(width: 12.0),
            ],
          ),
          if (comment.replies.isNotEmpty)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 1.0,
                  height: 40.0 * comment.replies.length,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(left: 0.0, top: 8.0, bottom: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: comment.replies.map(
                      (reply) {
                        return CommentCard(
                          comment: reply,
                          indentLevel: indentLevel + 1,
                        );
                      },
                    ).toList(),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}

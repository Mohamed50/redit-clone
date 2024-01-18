
import 'package:flutter/material.dart';

class VideoDetailsView extends StatelessWidget {
  const VideoDetailsView({
    super.key,
    required this.username,
    required this.userPicUrl,
    required this.postDesc,
  });

  final String username;
  final String userPicUrl;
  final String postDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
            backgroundImage: NetworkImage(userPicUrl),
            radius: 8,
          ),
          const SizedBox(width: 4),
              Text(
                username,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            postDesc,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

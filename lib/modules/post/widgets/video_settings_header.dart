import 'package:flutter/material.dart';

class VideoSettingsHeader extends StatelessWidget {
  const VideoSettingsHeader({
    super.key,
    required this.channelName, required this.channelImageUrl,
  });

  final String channelName;
  final String channelImageUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(channelImageUrl),
              radius: 10,
            ),
            const SizedBox(
              width: 6.0,
            ),
            Text(
              'r/$channelName',
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz, color: Colors.white),
        ),
      ],
    );
  }
}

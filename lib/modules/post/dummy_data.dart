import 'package:reddit_clone_flutter/modules/post/models/post_model.dart';
import 'models/comment_model.dart';

PostModel dummyPost = PostModel(
  id: '1',
  channelId: 'channel123',
  channelName: 'MechanicalKeyboards',
  channelPic: 'https://picsum.photos/8',
  description:
      'After a year of collecting parts for this build, I present my finished Heavy-9 (Thocky typing test at the end!)',
  videoUrl: 'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_20mb.mp4',
  numberOfVotes: 15,
  numberOfComments: dummyComments.length,
  userId: 'user456',
  userName: 'Xury46',
  userProfilePic: 'https://picsum.photos/8',
  comments: dummyComments,
);

List<CommentModel> dummyComments = [comment1, comment2, comment3, comment4, comment5, comment6];
CommentModel comment1 = CommentModel(
  id: '1',
  content: 'This is the first comment.',
  createdAt: DateTime.parse('2024-01-18T08:00:00Z'),
  userAvatarId: 'avatar_1',
  userId: 'user_1',
  username: 'User1',
  numberOfVotes: 42,
  isReply: false,
  replies: [],
);

CommentModel comment2 = CommentModel(
  id: '2',
  content: 'Reply to the first comment.',
  createdAt: DateTime.parse('2024-01-18T08:15:00Z'),
  userAvatarId: 'avatar_2',
  userId: 'user_2',
  username: 'User2',
  numberOfVotes: 17,
  isReply: true,
  replies: [],
);

CommentModel comment3 = CommentModel(
  id: '3',
  content: 'Another standalone comment.',
  createdAt: DateTime.parse('2024-01-18T09:30:00Z'),
  userAvatarId: 'avatar_3',
  userId: 'user_3',
  username: 'User3',
  numberOfVotes: 33,
  isReply: false,
  replies: [],
);

CommentModel comment4 = CommentModel(
  id: '4',
  content: 'Yet another reply.',
  createdAt: DateTime.parse('2024-01-18T10:45:00Z'),
  userAvatarId: 'avatar_4',
  userId: 'user_4',
  username: 'User4',
  numberOfVotes: 21,
  isReply: true,
  replies: [],
);

CommentModel comment5 = CommentModel(
  id: '5',
  content: 'A comment with replies.',
  createdAt: DateTime.parse('2024-01-18T11:00:00Z'),
  userAvatarId: 'avatar_5',
  userId: 'user_5',
  username: 'User5',
  numberOfVotes: 55,
  isReply: false,
  replies: [
    CommentModel(
      id: '5.1',
      content: 'Reply to the comment with replies.',
      createdAt: DateTime.parse('2024-01-18T11:15:00Z'),
      userAvatarId: 'avatar_6',
      userId: 'user_6',
      username: 'User6',
      numberOfVotes: 10,
      isReply: true,
      replies: [],
    ),
    CommentModel(
      id: '5.2',
      content: 'Another reply to the comment with replies.',
      createdAt: DateTime.parse('2024-01-18T11:30:00Z'),
      userAvatarId: 'avatar_7',
      userId: 'user_7',
      username: 'User7',
      numberOfVotes: 8,
      isReply: true,
      replies: [],
    ),
  ],
);

CommentModel comment6 = CommentModel(
  id: '6',
  content: 'A single reply.',
  createdAt: DateTime.parse('2024-01-18T12:00:00Z'),
  userAvatarId: 'avatar_8',
  userId: 'user_8',
  username: 'User8',
  numberOfVotes: 15,
  isReply: true,
  replies: [],
);



 
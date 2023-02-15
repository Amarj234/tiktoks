import 'user.dart';
import 'video.dart';

User currentuser = User('stackedlist','https://picsum.photos/id/1062/400/400');

User demoUser1 =User('user_1','https://picsum.photos/id/1062/400/400');

User demoUser2 =User('user_2','https://picsum.photos/id/1062/400/400');

User demoUser3 =User('user_3','https://picsum.photos/id/1062/400/400');

User demoUser4 =User('user_4','https://picsum.photos/id/1062/400/400');


final List<Video>videos=[
  Video('v1.mp4', demoUser1, 'caption', 'audioname', '12.5k', '123'),
  Video('v2.mp4', demoUser2, 'caption', 'audioname', '1.5M', '45k'),
  Video('v3.mp4', demoUser3, 'caption', 'audioname', '1k', '456'),
  Video('v4.mp4', demoUser4, 'caption', 'audioname', '12M', '89'),
];
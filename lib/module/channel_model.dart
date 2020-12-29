import 'package:code_warrior/Screen/MainPage.dart';
import 'package:code_warrior/module/video_model.dart';

class Channel {

  final String id;
  final String title;
  final String profilepicurl;
  final String subscribercount;
  final String videocount;
  final String uploadplaylistid;
  List<Video> videos;

  Channel({
      this.id,
      this.title,
      this.profilepicurl,
      this.subscribercount,
      this.videocount,
      this.uploadplaylistid,
      this.videos
  });

  factory Channel.fromMap(Map<String, dynamic> map){
    return Channel(
      id: map['id'],
      title: map['snippet']['title'],
      profilepicurl: map['snippet']['thumbnail']['default']['url'],
      subscribercount: map['statistics']['subscriberCount'],
      videocount: map['statistics']['videoCount'],
      uploadplaylistid: map['contentDetails']['relatedPlaylists']['uploads'],

    );
  }
}
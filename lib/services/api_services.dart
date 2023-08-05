import 'dart:convert';
import 'dart:io';

import 'package:code_warrior/module/channel_model.dart';
import 'package:code_warrior/module/video_model.dart';
import 'package:code_warrior/utilities/keys.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  static String _baseurl = 'www.googleapis.com';
  static String _nextPageToken = '';

  static Future<Channel> fetchChannel({required String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseurl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    //Get Channel
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      // Channel channel = Channel.fromMap(data);
      print(data);
      fetchVideosFromPlaylist(playlistId: data['contentDetails']['relatedPlaylists']['uploads']);
      //Fetch first batch of videos from uploads playlist
      // channel.videos = await fetchVideosFromPlaylist(
      //   playlistId: channel.uploadplaylistid!,
      // );
      return Channel();
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  static Future<List<Video>> fetchVideosFromPlaylist(
      {required String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlisIid': playlistId,
      'maxResults': '8',
      'pageToken': _nextPageToken,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseurl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    //Get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];
      //Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      videosJson.forEach(
        (json) => videos.add(
          Video.fromMap(json['snippet']),
        ),
      );
      print(videos);
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}

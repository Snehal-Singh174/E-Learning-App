import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

class Python_Playlist extends StatefulWidget {
  Python_Playlist({required this.title, required this.url});
  final String title;
  final String url;
  @override
  _Python_PlaylistState createState() => _Python_PlaylistState();
}

class _Python_PlaylistState extends State<Python_Playlist> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(widget.url));
    return json.decode(response.body);
  }

  var videosList = [
    {
      "contentDetails": {
        "videoId": "59kONxYVhzQ"
      },
      "snippet": {
        "thumbnails": {
          "high": {
            "url": "https://i9.ytimg.com/vi_webp/59kONxYVhzQ/mqdefault.webp?v=5edf1ba0&sqp=CPyWr6YG&rs=AOn4CLCcxTAOhUUpQq43DB7fV5n2AEnklA"
          }
        },
        "title": "Computer Vision Introduction & Setup | Computer Vision |  Python | OpenCV| Code Warriors"
      }
    },
    {
      "contentDetails": {
        "videoId": "59kONxYVhzQ"
      },
      "snippet": {
        "thumbnails": {
          "high": {
            "url": "https://i9.ytimg.com/vi_webp/59kONxYVhzQ/mqdefault.webp?v=5edf1ba0&sqp=CPyWr6YG&rs=AOn4CLCcxTAOhUUpQq43DB7fV5n2AEnklA"
          }
        },
        "title": "Computer Vision Introduction & Setup | Computer Vision |  Python | OpenCV| Code Warriors"
      }
    },
    {
      "contentDetails": {
        "videoId": "59kONxYVhzQ"
      },
      "snippet": {
        "thumbnails": {
          "high": {
            "url": "https://i9.ytimg.com/vi_webp/59kONxYVhzQ/mqdefault.webp?v=5edf1ba0&sqp=CPyWr6YG&rs=AOn4CLCcxTAOhUUpQq43DB7fV5n2AEnklA"
          }
        },
        "title": "Computer Vision Introduction & Setup | Computer Vision |  Python | OpenCV| Code Warriors"
      }
    }
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF62B9BF),
      ),
      body: ListVideo(
        list: videosList,
      )

      // new FutureBuilder<List>(
      //     future: getData(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) print(snapshot.error);
      //       return snapshot.hasData
      //           ? new ListVideo(
      //               list: snapshot.data,
      //             )
      //           : Center(child: new CircularProgressIndicator());
      //     }),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List? list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new VideoPlay(
                                url:
                                    "https://youtube.com/embed/${list![i]['contentDetails']['videoId']}",
                              )));
                },
                child: new Container(
                  height: 210,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(
                            list![i]['snippet']['thumbnails']['high']['url']),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              new Text(
                list![i]['snippet']['title'],
                style: new TextStyle(fontSize: 18.0),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              new Divider(
                color: Colors.black12,
                thickness: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class VideoPlay extends StatelessWidget {
  final String? url;
  VideoPlay({this.url});
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: WebviewScaffold(
        url: url!,
      ),
    );
  }
}

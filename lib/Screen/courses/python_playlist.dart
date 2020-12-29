import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Python_Playlist extends StatefulWidget {
  Python_Playlist({this.title,this.url});
  final String title;
  final String url;
  @override
  _Python_PlaylistState createState() => _Python_PlaylistState();
}

class _Python_PlaylistState extends State<Python_Playlist> {

  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF62B9BF),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
          builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ListVideo(list: snapshot.data,)
              : Center(child: new CircularProgressIndicator());
          }
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list==null?0:list.length,
        itemBuilder: (context, i){
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>new VideoPlay(url: "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",)));
                  },
                  child: new Container(
                    height: 210,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(
                              list[i]['snippet']['thumbnails']['high']['url']),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0),),
                new Text(list[i]['snippet']['title'],style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.all(10.0),),
                new Divider(color: Colors.black12,thickness: 2,),
              ],
            ),
          );
        },
    );
  }
}

class VideoPlay extends StatelessWidget {
  final String url;
  VideoPlay({this.url});
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: WebviewScaffold(
        url: url,
      ),
    );
  }
}


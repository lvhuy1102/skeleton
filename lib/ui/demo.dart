import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  static String key = "AIzaSyDh_tSLqXTgrGcpkzdmBUWEUt_x0EhVmKs";
  static int max = 50;
  static  String type = "channel";
  YoutubeAPI ytApi = new YoutubeAPI(key, maxResults: max, type: type);
  List<YT_API> ytResult = [];


  callAPI() async {
    String channelId = "UCv6QkGD2ugpuVlceo-fQqMw";
    ytResult =  await ytApi.channel(channelId,order: "date");
    // ytResult = await ytApi.nextPage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube API'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: ytResult.length,
          itemBuilder: (_, int index) => listItem(index),
        ),
      ),
    );
  }

  Widget listItem(index) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Image.network(
              ytResult[index].thumbnail['default']['url'],
            ),
            Padding(padding: EdgeInsets.only(right: 20.0)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ytResult[index].title,
                        softWrap: true,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 1.5)),
                      Text(
                        ytResult[index].channelTitle,
                        softWrap: true,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 3.0)),
                      Text(
                        ytResult[index].url,
                        softWrap: true,
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
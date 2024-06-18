import 'package:flutter/material.dart';
import 'package:newss/view/detail_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsContainer({
    super.key,
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: "assets/img/placeholder.jpg",
            image: imgUrl,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  newsHead.length > 60
                      ? "${newsHead.substring(0, 60)}..."
                      : newsHead,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  newsDes,
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
                SizedBox(height: 20),
                Text(
                  newsCnt != "--"
                      ? newsCnt.length > 100
                      ? newsCnt.substring(0, 100) + "..."
                      : newsCnt
                      : newsCnt,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailViewScreen(newsUrl: newsUrl),
                      ),
                    );
                  },
                  child: Text("Read More"),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Added spacing at the bottom
        ],
      ),
    );
  }
}

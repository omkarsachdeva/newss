import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:newss/model/newsArt.dart';
class FetchNews {
  static List sourcesId = [
    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-hindu",

    "the-wall-street-journal",

    "the-washington-times",
    "time",
    "usa-today",

  ];

  static Future<NewsArt> fetchNews() async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=c202fd6f630c487683e755dca7432489"));
    if (response.statusCode == 429 &&
        jsonDecode(response.body)['code'] == 'rateLimited') {
      // Show a message to the user about exceeding rate limit
      print('Rate limit exceeded. Please try again later.');
      // Handle the error in your UI (e.g., display an error message)
    } else {
      // Process the response as usual
      // ...
    }
    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];

    final _Newrandom = new Random();
    var myArticle = articles[_random.nextInt(articles.length)];


    return NewsArt.fromAPItoApp(myArticle);
  }
}

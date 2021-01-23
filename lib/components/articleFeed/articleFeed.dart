import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/newsCard/newsCard.dart';
import 'package:flutter_workshop/models/article.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class ArticleFeed extends StatefulWidget {
  ArticleFeed({Key key}) : super(key: key);

  @override
  _ArticleFeedState createState() => _ArticleFeedState();
}

class _ArticleFeedState extends State<ArticleFeed> {
  var url = 'https://www.spaceflightnewsapi.net/api/v2/articles/';
  List<Article> articles = [];

  _getArticles() {
    http.get(url).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        articles = list.map((article) => Article.fromJson(article)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return articles.length != 0
            ? NewsCard(
                article: articles[index],
              )
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 100,
                  child: Loading(
                    indicator: BallPulseIndicator(),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ]);
      }, childCount: articles.length != 0 ? articles.length : 1),
    );
  }
}

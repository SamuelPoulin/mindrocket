import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/newsCard.dart';
import 'package:flutter_workshop/models/article.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: _SliverMainPageHeaderDelegate(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(height: 50),
                                  Row(
                                    children: [
                                      Text(
                                        'Explore space news',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Latest news',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        minHeight: 150,
                        maxHeight: 200),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 50),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return articles.length != 0
                            ? NewsCard(
                                article: articles[index],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    SizedBox(
                                      width: 100,
                                      child: Loading(
                                        indicator: BallPulseIndicator(),
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ]);
                      },
                          childCount:
                              articles.length != 0 ? articles.length : 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SliverMainPageHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverMainPageHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverMainPageHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

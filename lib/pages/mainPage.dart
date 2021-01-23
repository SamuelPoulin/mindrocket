import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/articleFeed/articleFeed.dart';

import 'package:flutter_workshop/components/articleFeed/articleFeedHeader.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  ArticleFeedHeader(),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 50),
                    sliver: ArticleFeed(),
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

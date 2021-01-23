import 'package:flutter/material.dart';
import 'dart:math' as math;

class ArticleFeedHeader extends StatefulWidget {
  ArticleFeedHeader({Key key}) : super(key: key);

  @override
  _ArticleFeedHeaderState createState() => _ArticleFeedHeaderState();
}

class _ArticleFeedHeaderState extends State<ArticleFeedHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
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
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Latest news',
                          style: Theme.of(context).textTheme.headline2,
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

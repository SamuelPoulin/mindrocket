import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/newsCard/articleContent.dart';
import 'package:flutter_workshop/components/newsCard/siteNamePill.dart';
import 'package:flutter_workshop/models/article.dart';

class NewsCard extends StatefulWidget {
  final Article article;

  NewsCard({Key key, this.article}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () => {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Ink(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.article.imageUrl,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SiteNamePill(newsSite: widget.article.newsSite)
                      ],
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: [
                        ArticleContent(
                          title: widget.article.title,
                          summary: widget.article.summary,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

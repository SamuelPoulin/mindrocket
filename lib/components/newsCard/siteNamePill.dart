import 'package:flutter/material.dart';

class SiteNamePill extends StatefulWidget {
  final String newsSite;

  SiteNamePill({Key key, this.newsSite}) : super(key: key);

  @override
  _SiteNamePillState createState() => _SiteNamePillState();
}

class _SiteNamePillState extends State<SiteNamePill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).accentColor),
      child: Text(
        widget.newsSite,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

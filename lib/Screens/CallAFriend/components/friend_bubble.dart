import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/bean/friend.dart';

class FriendBubble extends StatefulWidget {
  final Friend friend;

  const FriendBubble({Key key, this.friend, }) : super(key: key);

  @override
  _FriendBubbleState createState() => _FriendBubbleState();
}

class _FriendBubbleState extends State<FriendBubble> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0), //line and text
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0), // just text
      decoration: BoxDecoration(
          color: transparent,
          border: Border(
            bottom: BorderSide(
              color: Color(0xff595669),
              width: 2.0,
            ),
          )),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(widget.friend.name, style: textTheme.subhead),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

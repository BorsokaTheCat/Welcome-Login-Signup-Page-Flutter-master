import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CallAFriend/components/background.dart';
import 'package:flutter_auth/Screens/CallAFriend/components/friend_bubble.dart';
import 'package:flutter_auth/Screens/StopWatch/stop_watch_page.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class CallAFriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(friendList.length);
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                color: transparent,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: blue,
                  ),
                  onPressed: null))
        ],
      ),*/
      body: SafeArea(
        child: Background(
            child: Column(children: [
          // some top content

          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: friendList.length,
                itemBuilder: (BuildContext context, int index) =>
                    FriendBubble(friend: friendList[index])),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //color: Colors.pink,
                    height: size.height * 0.3,
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: new BoxDecoration(
                          color: transparent,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: blue,
                            ),
                            onPressed: null)),
                  ),
                ),
                Container(
                  //color: Colors.green,
                  height: size.height * 0.3,
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/message.png",
                    width: size.width * 0.70,
                  ),
                ),
              ],
            ),
          ), // some bottom content
        ])),
      ),
    );
  }
}

Widget _firstListView() {
  return Container(
    color: Colors.green,
    child: ListView.builder(
      itemCount: friendList.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) => FriendBubble(friend: friendList[index]),
    ),
  );
}

/*Widget _firstListView() {
  return ListView.builder(
    itemCount: friendList.length,
    itemBuilder: (context, index) {
      return FriendBubble(friend: friendList[index]);
    },

  );
}*/

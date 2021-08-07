import 'package:flutter/material.dart';

import '../../../constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 30,
            //left: 3,
            child: Image.asset(
              "assets/images/background.png",
              width: size.width * 0.90,
            ),
          ),
          /*Positioned(
            bottom: 30,
            right: 3,
            child: Image.asset(
              "assets/images/message.png",
              width: size.width * 0.70,
            ),
          ),*/
          child,
        ],
      ),
    );
  }
}

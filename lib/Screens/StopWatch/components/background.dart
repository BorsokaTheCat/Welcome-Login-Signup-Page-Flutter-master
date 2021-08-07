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
              "assets/images/bridge.png",
              width: size.width * 0.90,
            ),
          ),
          Positioned(
            top: 150,
            //left: 60,
            child: Container(
              width: 250.0,
              height: 250.0,
              decoration: new BoxDecoration(
                color: transparent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          /*Positioned(
            top: 150,
            //left: 60,
            child: Container(
              width: 250.0,
              height: 250.0,
              decoration: new BoxDecoration(
                //color: Color(0xAA2f2e41),
                //shape: BoxShape.circle,
                borderRadius: BorderRadius.all( Radius.circular(300.0)),
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
              ),

            ),
          ),*/
          child,
        ],
      ),
    );
  }
}

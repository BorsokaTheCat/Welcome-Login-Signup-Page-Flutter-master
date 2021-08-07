import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class TimerButton extends StatelessWidget {
  final Function press;
  final Icon icon;
  final Color color, textColor;

  const TimerButton({
    Key key,
    this.icon,
    this.press,
    this.color = blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: darkGrey,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: icon,
        onPressed: press,
      ),
    );
  }
}

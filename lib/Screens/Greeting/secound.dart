import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Greeting/third.dart';
import 'package:flutter_auth/components/rounded_button.dart';

import '../../constants.dart';

class SecoundPage extends StatelessWidget {
  const SecoundPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Image.asset(
                "assets/images/todo.png",
                height: size.height * 0.55,
              ),
              /*SvgPicture.asset(
                "assets/images/todo.svg",
                height: size.height * 0.35,
              ),*/
              SizedBox(height: size.height * 0.1),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                child: Text(
                  "I will remind you of your important tasks from time to time. I promise there won't be much.:)",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: darkGrey),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LOVE IT",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ThirdPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

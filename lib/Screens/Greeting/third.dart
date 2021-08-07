import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/StopWatch/stop_watch_page.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class ThirdPage extends StatelessWidget {

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
                "assets/images/todo3.png",
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
                  "Your only task for the next few hour to enjoy the night.",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, color: darkGrey),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LET'S GET STARTED",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return StopWatchPage();
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

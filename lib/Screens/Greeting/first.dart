import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Greeting/secound.dart';
import 'package:flutter_auth/components/rounded_button.dart';

import '../../constants.dart';

class FirstGreetingPage extends StatelessWidget {
  const FirstGreetingPage({
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
              SizedBox(height: size.height * 0.07),
              Text(
                "Hi Bence!",
                style: TextStyle(fontWeight: FontWeight.bold, color: darkGrey, fontSize: 30),
              ),
              Image.asset(
                "assets/images/hi.png",
                height: size.height * 0.40,
              ),
              /*SvgPicture.asset(
                "assets/images/hi.png",
                height: size.height * 0.35,
              ),*/
              SizedBox(height: size.height * 0.2),
              Text(
                "I'm Liza. I will help you in the next few ours avoid embarrassing situations if you let me.",
                style: TextStyle(fontWeight: FontWeight.bold, color: darkGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LETS GO",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SecoundPage();
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

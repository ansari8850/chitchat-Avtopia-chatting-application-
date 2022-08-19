import 'package:chitchat/presentation/screens/registration_screen.dart';
import 'package:chitchat/presentation/widgets/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Welcome to CHitChat Room",
              style: TextStyle(
                  fontSize: 20,
                  color: PrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 290,
              width: 920,
              child: Image.asset("assets/wall1.jpg"),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Read and agree the teram and policy Tap,'Agree & Continue'to accept thr terms and Services",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "AGREE AND CONTINUE",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

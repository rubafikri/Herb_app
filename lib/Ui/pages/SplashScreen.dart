import 'package:flutter/material.dart';
import 'package:gsgass1/services/auth_helper.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Home.dart';
import 'Login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (AuthHelper.authHelper.checkUser()) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return Home();
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return Login();
        }));
      }
    });
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Container(
              width: 1000,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/photo.png'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'welcome to',
                        style: TextStyle(
                          color: HexColor('#6E8F60'),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Image(image: AssetImage('assets/images/logo.png')),
                    Container(
                      padding: EdgeInsets.only(top: 15, bottom: 50),
                      child: Text(
                        'THE HUB FOR ALL YOUR SPICES',
                        style: TextStyle(
                          color: HexColor('#6E8F60'),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Image(image: AssetImage('assets/images/stamp.png')),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

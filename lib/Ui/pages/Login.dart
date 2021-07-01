import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gsgass1/services/auth_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:string_validator/string_validator.dart';

import 'Home.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool visiblbool = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 60),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: Container(
                width: 132,
                height: 132,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 27,
                  color: HexColor('#068F6E'),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              controller: emailcontroller,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, right: 15, left: 15),
            child: TextFormField(
              obscureText: visiblbool,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              controller: passwordcontroller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      visiblbool ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        visiblbool = !visiblbool;
                      });
                    }),
                hintStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
                hintText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 10),
            child: TextButton(
                onPressed: () async {
                  AuthHelper.authHelper.forget(emailcontroller.text);
                },
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    color: HexColor('#068F6E'),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Center(
              child: InkWell(
                onTap: () async {
                  if (emailcontroller.text == '') {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'Please Enter Your Email',
                    );
                  }
                  if (!isEmail(emailcontroller.text)) {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'Please Enter Valid Email',
                    );
                  } else if (passwordcontroller.text == '') {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'Please Enter Your password',
                    );
                  } else if (passwordcontroller.text.length < 6) {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'Your password Must be larger than 6 char',
                    );
                  } else {
                    await AuthHelper.authHelper.login(
                        emailcontroller.text, passwordcontroller.text, context);

                    if (FirebaseAuth.instance.currentUser.emailVerified) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    } else {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: 'You Have to verfied',
                      );
                    }
                  }
                },
                child: Container(
                  width: 161,
                  height: 42,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#068F6E'), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#068F6E')),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return SignUp();
                }));
              },
              child: Text(
                'Do not Have an account! Register NOW',
                style: TextStyle(
                  color: HexColor('#068F6E'),
                ),
              )),
        ],
      ),
    ));
  }
}

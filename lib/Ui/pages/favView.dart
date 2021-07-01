import 'package:flutter/material.dart';
import 'package:gsgass1/Ui/models/Herb.dart';
import 'package:gsgass1/Ui/pages/viewFav.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Home.dart';

class FavView extends StatelessWidget {
  Herb herb;
  FavView(this.herb);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/herbview.png'),
                  fit: BoxFit.cover)),
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#A0C391'),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pop(MaterialPageRoute(builder: (context) {
                          return ViewFav();
                        }));
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      herb.name,
                      style: TextStyle(
                          color: HexColor('#A0C391'),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      'INGREDIENTS',
                      style: TextStyle(
                          color: HexColor('#A0C391'),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 38,
                    ),
                    child: Text(
                      herb.ingrediants,
                      style: TextStyle(
                          color: HexColor('#6C7B6B'),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      'PREPARATION',
                      style: TextStyle(
                          color: HexColor('#A0C391'),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 38,
                      bottom: 20,
                    ),
                    child: Text(
                      herb.prepation,
                      style: TextStyle(
                          color: HexColor('#6C7B6B'),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/box.png'),
                      fit: BoxFit.cover))),
        ),
      ),
    );
  }
}

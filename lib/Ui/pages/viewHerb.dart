import 'package:flutter/material.dart';
import 'package:gsgass1/Ui/models/Herb.dart';
import 'package:gsgass1/services/firstore_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Home.dart';

class HerbView extends StatefulWidget {
  Herb herb;
  HerbView(this.herb);

  @override
  _HerbViewState createState() => _HerbViewState();
}

class _HerbViewState extends State<HerbView> {
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
                          return Home();
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
                      widget.herb.name,
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
                      widget.herb.ingrediants,
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
                      widget.herb.prepation,
                      style: TextStyle(
                          color: HexColor('#6C7B6B'),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 60,
                    ),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.favorite,
                        color: widget.herb.isFav ? Colors.red : Colors.white,
                      ),
                      label: Text('ADD TO FAVORITES '),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#A0C391'),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      onPressed: () async {
                        setState(() {});
                        widget.herb.isFav = true;
                        await FirstoreHelper.firstoreHelper.editProduct(
                            Herb(
                                name: widget.herb.name,
                                ingrediants: this.widget.herb.ingrediants,
                                shortDiscription:
                                    this.widget.herb.shortDiscription,
                                prepation: this.widget.herb.prepation,
                                id: this.widget.herb.id,
                                isFav: this.widget.herb.isFav),
                            widget.herb.id);
                      },
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

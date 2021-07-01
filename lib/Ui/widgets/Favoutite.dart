import 'package:flutter/material.dart';
import 'package:gsgass1/Ui/models/Herb.dart';
import 'package:gsgass1/Ui/pages/favView.dart';
import 'package:gsgass1/Ui/pages/viewHerb.dart';
import 'package:hexcolor/hexcolor.dart';

class Favourite extends StatelessWidget {
  Herb herb;

  Favourite(this.herb);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: HexColor('#068F6E'))),
        child: Column(
          children: [
            ListTile(
              title: ListTile(
                title: Container(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    alignment: Alignment.center,
                    child: Text(herb.name)),
                subtitle: Container(
                  alignment: Alignment.center,
                  child: Text(herb.shortDiscription),
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.1,
                        primary: HexColor('#6E8F60'),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FavView(herb);
                        }));
                      },
                      child: Text(
                        'view',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}

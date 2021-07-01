import 'package:flutter/material.dart';
import 'package:gsgass1/Ui/models/Herb.dart';
import 'package:gsgass1/Ui/widgets/TextFormStyle.dart';
import 'package:gsgass1/services/firstore_helper.dart';

import 'package:hexcolor/hexcolor.dart';

import 'Home.dart';

class EditHerb extends StatefulWidget {
  Herb herb;

  EditHerb(this.herb);

  @override
  _EditHerbState createState() => _EditHerbState();
}

class _EditHerbState extends State<EditHerb> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController shortDesccontroller = TextEditingController();

  TextEditingController ingrdiatecontroller = TextEditingController();

  TextEditingController prprationcontroller = TextEditingController();

  TextEditingController idcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
        backgroundColor: HexColor('#6E8F60'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.herb.name,
              onChanged: (value) {
                widget.herb.name = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.herb.shortDiscription,
              onChanged: (value) {
                widget.herb.shortDiscription = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 5,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.herb.ingrediants,
              onChanged: (value) {
                widget.herb.ingrediants = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 6,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.herb.prepation,
              onChanged: (value) {
                widget.herb.prepation = value;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: Icon(Icons.edit),
              label: Text('EDIT '),
              style: ElevatedButton.styleFrom(
                primary: HexColor('#C2DEAE'),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              ),
              onPressed: () async {
                print(widget.herb.toMap());
                await FirstoreHelper.firstoreHelper.editProduct(
                    Herb(
                        name: widget.herb.name,
                        ingrediants: this.widget.herb.ingrediants,
                        shortDiscription: this.widget.herb.shortDiscription,
                        prepation: this.widget.herb.prepation,
                        id: this.widget.herb.id),
                    widget.herb.id);

                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
            ),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:gsgass1/Ui/models/Herb.dart';
import 'package:gsgass1/Ui/widgets/TextFormStyle.dart';
import 'package:gsgass1/services/firstore_helper.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:uuid/uuid.dart';

import 'Home.dart';

class AddHerb extends StatefulWidget {
  @override
  _AddHerbState createState() => _AddHerbState();
}

class _AddHerbState extends State<AddHerb> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController shortDesccontroller = TextEditingController();
  TextEditingController ingrdiatecontroller = TextEditingController();
  TextEditingController prprationcontroller = TextEditingController();

  var uid = Uuid();

  bool visiblbool = true;
  GlobalKey<FormState> form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe'),
        backgroundColor: HexColor('#6E8F60'),
        centerTitle: true,
      ),
      body: Form(
        key: form,
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            TextFormStyle(
              hintText: 'Name',
              editingController: namecontroller,
              lines: 1,
            ),
            TextFormStyle(
              hintText: 'Short Description',
              editingController: shortDesccontroller,
              lines: 2,
            ),
            TextFormStyle(
              hintText: 'INGREDIENTS',
              editingController: ingrdiatecontroller,
              lines: 6,
            ),
            TextFormStyle(
              hintText: 'PREPARATION',
              editingController: prprationcontroller,
              lines: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('ADD NEW '),
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#C2DEAE'),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                ),
                onPressed: () async {
                  if (form.currentState.validate()) {
                    form.currentState.save();
                    String name = namecontroller.text;
                    String ingre = ingrdiatecontroller.text;
                    String short = shortDesccontroller.text;
                    String pre = prprationcontroller.text;
                    await FirstoreHelper.firstoreHelper.addHerb(Herb(
                        name: name,
                        ingrediants: ingre,
                        prepation: pre,
                        shortDiscription: short,
                        id: uid.v4()));
                  }
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

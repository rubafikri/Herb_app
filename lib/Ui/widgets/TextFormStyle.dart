import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TextFormStyle extends StatelessWidget {
  String hintText;
  int lines;
  TextEditingController editingController;
  String init;
  TextFormStyle({this.hintText, this.editingController, this.lines, this.init});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: TextFormField(
        initialValue: init,
        maxLines: lines,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        controller: editingController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 17,
            color: HexColor('#6E8F60'),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
          hintText: hintText,
        ),
      ),
    );
  }
}

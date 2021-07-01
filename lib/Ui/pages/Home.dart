import 'package:flutter/material.dart';
import 'package:gsgass1/Ui/models/Herb.dart';
import 'package:gsgass1/Ui/pages/addHerb.dart';
import 'package:gsgass1/Ui/pages/viewFav.dart';
import 'package:gsgass1/Ui/widgets/herb_itemlist.dart';
import 'package:gsgass1/services/firstore_helper.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Herb> herbs;

  updateTask(Herb herb) async {
    await FirstoreHelper.firstoreHelper.editProduct(herb, herb.id);
    getAllHerbs();
  }

  removeHerb(String id) async {
    await FirstoreHelper.firstoreHelper.deleteHerb(id);
    getAllHerbs();
  }

  getAllHerbs() async {
    herbs = await FirstoreHelper.firstoreHelper.getAllHerbs();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllHerbs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: HexColor('#6E8F60'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ViewFav(herbs: herbs);
                  }));
                },
                icon: Icon(Icons.favorite)),
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddHerb();
                }));
                herbs.forEach((element) {
                  print(element.name);
                });
                print(herbs.toList());
              },
              icon: Icon(Icons.add)),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15)),
            child: herbs == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: herbs.length,
                    itemBuilder: (context, index) {
                      return HerbItemList(herbs[index], updateTask, removeHerb);
                    })),
      ),
    );
  }
}

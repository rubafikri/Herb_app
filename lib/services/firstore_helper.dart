import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gsgass1/Ui/models/Herb.dart';

class FirstoreHelper {
  FirstoreHelper._();
  static FirstoreHelper firstoreHelper = FirstoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  addHerb(Herb herb) async {
    await firebaseFirestore
        .collection('herbs')
        .doc(herb.id)
        .set({...herb.toMap()});
  }

  Future<List<Herb>> getAllHerbs() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.collection('herbs').get();
    List<Herb> herbs = querySnapshot.docs.map((e) {
      return Herb.fromMap(e.data());
    }).toList();
    return herbs;
  }

  deleteHerb(String id) async {
    await firebaseFirestore.collection('herbs').doc(id).delete();
  }

  editProduct(Herb herb, String id) async {
    // DocumentReference documentReference =
    //     firebaseFirestore.collection('herbs').doc(documentId);
    // print(documentReference.id);
    await firebaseFirestore.collection('herbs').doc(id).set({...herb.toMap()});
  }
}

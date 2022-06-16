import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireStoreServices {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference books = FirebaseFirestore.instance.collection('Users');

  Future addBook(String id, String name) async {
    // try{
    //   DocumentReference documentReference = books.doc(uid).collection('Books').doc(id);

    // }
  }
  Future deleteBook(String id) async {
    books.doc(uid).collection('Books').doc(id).delete();
  }
}

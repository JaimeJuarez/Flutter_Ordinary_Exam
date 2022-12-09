import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsers() async {
  List usuarios = [];

  CollectionReference usersReference = db.collection('users');

  QuerySnapshot queryUsers = await usersReference.get();

  for (var doc in queryUsers.docs) {
    usuarios.add(doc.data());
  }
  return usuarios;
}

Future<void> addUser(
    String name, String email, String password, String rol) async {
  CollectionReference usersReference = db.collection('users');

  usersReference.add({
    'name': name,
    'email': email,
    'password': password,
    'rol': rol,
  });
}

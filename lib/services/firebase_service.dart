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

Future<Map<String, dynamic>> getUsersByID(String id) async {
  // List usuarios = [];

  CollectionReference usersReference = db.collection('users');

  QuerySnapshot queryUsers = await usersReference.get();

  for (var doc in queryUsers.docs) {
    if (doc.data()['id'] == id) {
      return doc.data();
    }
  }
  return null;
}

Future<void> addUser(
    String name, String email, String password, String rol, String id) async {
  await db.collection('users').doc(id).set(
    {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'rol': rol,
    },
  );
}

Future<void> editUser(
    String name, String email, String password, String rol, String id) async {
  await db.collection('users').doc(id).update(
    {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'rol': rol,
    },
  );
}

Future<List> getInventary() async {
  List inventary = [];

  CollectionReference inventarioReference = db.collection('inventario');

  QuerySnapshot queryInventary = await inventarioReference.get();

  for (var doc in queryInventary.docs) {
    inventary.add(doc.data());
  }
  return inventary;
}

Future<Map<String, dynamic>> getInventaryByID(String id) async {
  // List usuarios = [];

  CollectionReference inventaryReference = db.collection('inventario');

  QuerySnapshot queryInventary = await inventaryReference.get();

  for (var doc in queryInventary.docs) {
    if (doc.data()['id'] == id) {
      return doc.data();
    }
  }
  return null;
}

Future<void> addInventary(String noinventario, String descripcion,
    String departamento, String imagen, String id) async {
  // CollectionReference inventaryReference =
  await db.collection('inventario').doc(id).set(
    {
      'id': id,
      'noinventario': noinventario,
      'descripcion': descripcion,
      'departamento': departamento,
      'imagen': imagen,
    },
  );
}

Future<void> editInventary(String noinventario, String descripcion,
    String departamento, String imagen, String id) async {
  // CollectionReference inventaryReference =
  await db.collection('inventario').doc(id).update(
    {
      'id': id,
      'noinventario': noinventario,
      'descripcion': descripcion,
      'departamento': departamento,
      'imagen': imagen,
    },
  );
}

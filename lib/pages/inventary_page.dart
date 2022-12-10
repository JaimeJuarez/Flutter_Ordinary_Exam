import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/edit_inventary.dart';
import 'package:flutter_application_1/pages/registrer_inventary.dart';
import 'package:flutter_application_1/services/firebase_service.dart';

void main() => runApp(const InventaryPage());

class InventaryPage extends StatefulWidget {
  const InventaryPage({Key key}) : super(key: key);

  @override
  State<InventaryPage> createState() => _InventaryPageState();
}

class _InventaryPageState extends State<InventaryPage> {
  @override
  Widget build(BuildContext context) {
    const SizedBox(height: 35.0);
    // _Singup
    return const Center(
      child: Cards(),
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({Key key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getInventary(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data[index]["descripcion"]),
                          subtitle: Text(snapshot.data[index]["departamento"] +
                              " " +
                              '(${snapshot.data[index]["noinventario"]})'),
                          leading:
                              Image.network(snapshot.data[index]["imagen"]),
                          trailing: PopupMenuButton(
                              // color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              itemBuilder: ((context) => [
                                    PopupMenuItem(
                                        child: ListTile(
                                      leading: const Icon(Icons.delete),
                                      title: const Text('Eliminar',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              fontFamily: 'Heebo')),
                                      onTap: () {
                                        db
                                            .collection('inventario')
                                            .doc(snapshot.data[index]["id"])
                                            .get()
                                            .then((doc) {
                                          if (doc.exists) {
                                            doc.reference.delete();
                                            setState(() {});
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                    )),
                                    PopupMenuItem(
                                      child: ListTile(
                                          leading: const Icon(Icons.edit),
                                          title: const Text('Editar',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'Heebo')),
                                          onTap: () async {
                                            snapshot.data[index]["id"];
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditInventary(
                                                            inventaryID:
                                                                snapshot.data[
                                                                        index]
                                                                    ["id"])));
                                            setState(() {});
                                            Navigator.pop(context);
                                          }),
                                    )
                                  ])),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  });
            })),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, RegisterInventary.id);
            setState(() {});
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ));
  }

  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Inventary").doc("noinventario");

    documentReference.delete().whenComplete(() {
      // print("deleted");
    });
  }
}

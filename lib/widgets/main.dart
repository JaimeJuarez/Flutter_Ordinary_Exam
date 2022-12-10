import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocks/provider.dart';
import 'package:flutter_application_1/objetcs/cart_model.dart';
import 'package:flutter_application_1/pages/edit_inventary.dart';
import 'package:flutter_application_1/pages/edit_user.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/register_user.dart';
import 'package:flutter_application_1/pages/user_page.dart';
import 'package:provider/provider.dart';

// ignore: unused_import
import '../firebase_options.dart';
import '../pages/registrer_inventary.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({super.key});
  List usuarios = [];
  @override
  void initState() {
    super.initState();
    getUsers();
    // Firebase.initializeApp();
  }

  void getUsers() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot users = await collectionReference.get();

    if (users.docs.isNotEmpty) {
      for (var doc in users.docs) {
        usuarios.add(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: ProviderLogin(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Exam',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: LoginPage.id,
          routes: {
            LoginPage.id: (_) => const LoginPage(),
            UserPage.id: (_) => const UserPage(),
            RegisterUser.id: (_) => const RegisterUser(),
            RegisterInventary.id: (_) => const RegisterInventary(),
            EditInventary.id: (_) => const EditInventary(),
            EditUser.id: (_) => const EditUser(),
          },
        ),
      ),
    );
  }
}

// ignore_for_file: unused_import

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocks/provider.dart';
import 'package:flutter_application_1/pages/register_user.dart';
import 'package:flutter_application_1/pages/user_page.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page";

  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectLogin = true;
  String email, password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderLogin.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 0.0),
            Stack(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 110, 0, 0),
                    child: const Text(
                      "Hello James",
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 22, 22, 22),
                        fontFamily: 'Heebo',
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 35.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [],
            ),
            _columnLogin(bloc),
          ],
        ),
      ),
      // ),
    );
  }

  Widget _buttonLogin() {
    return MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 125.0, vertical: 18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () async {
          try {
            final user = await _auth.signInWithEmailAndPassword(
                email: email, password: password);
            if (user != null) {
              // ignore: use_build_context_synchronously
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const UserPage();
              }));
            }
          } catch (e) {
            // ignore: avoid_print
            print(e);
            AlertDialog(
              title: const Text('Error'),
              content: const Text('Error al iniciar sesion'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          }
        },
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Text(
          'Entrar'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget _forgotPassword() {
    return Container(
      alignment: const Alignment(1, 0),
      padding: const EdgeInsets.only(top: 0, right: 30.0),
      child: InkWell(
        onTap: () {},
        child: const Text(
          'Olvidaste tu contraseña?',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Heebo',
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _textFieldEmailLogin(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _TextFieldGeneral(
          'Correo Electronico',
          'ExampleMail@mail.com',
          Icons.mail_outline,
          // bloc.changeEmail,
          (value) {
            email = value;
          },
          TextInputType.emailAddress,
          false,
          snapshot.error,
        );
      },
    );
  }

  Widget _textFieldPasswordLogin(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _TextFieldGeneral(
          'Contraseña',
          'Ejemplo: 123456',
          Icons.lock_outline_rounded,
          // bloc.changePassword,
          (value) {
            password = value;
          },
          null,
          true,
          snapshot.error,
        );
      },
    );
  }

  Widget _columnLogin(LoginBloc bloc) {
    return Column(
      children: [
        const SizedBox(
          height: 25.0,
        ),
        _textFieldEmailLogin(bloc),
        const SizedBox(
          height: 15.0,
        ),
        _textFieldPasswordLogin(bloc),
        const SizedBox(
          height: 25.0,
        ),
        const Text(
          'Olvidé mi Contraseña',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        _forgotPassword(),
        const SizedBox(
          height: 65.0,
        ),
        _buttonLogin(),
        const SizedBox(
          height: 25.0,
        ),
        // _buttonRegister(),
      ],
    );
  }
}

class _TextFieldGeneral extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  // final void Function() onChanged;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final String errorText;
  const _TextFieldGeneral(
    this.labelText,
    this.hintText,
    this.icon,
    this.onChanged,
    this.keyboardType,
    this.obscureText,
    this.errorText,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

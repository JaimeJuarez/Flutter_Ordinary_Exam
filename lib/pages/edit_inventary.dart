import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_service.dart';

import '../blocks/login_Bloc.dart';

class EditInventary extends StatefulWidget {
  static String id = "edit_inventary";
  const EditInventary({Key key, this.inventaryID}) : super(key: key);
  final String inventaryID;
  @override
  State<EditInventary> createState() => _EditInventaryState();
}

class _EditInventaryState extends State<EditInventary> {
  final TextEditingController _noinventarioController =
      TextEditingController(text: "");
  final TextEditingController _descripcionController =
      TextEditingController(text: "");
  final TextEditingController _departamentoController =
      TextEditingController(text: "");
  final TextEditingController _imagenController =
      TextEditingController(text: "");
  // final TextEditingController _idController = TextEditingController(text: "");
  final bloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar Inventario'),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: getInventaryByID(widget.inventaryID),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              _noinventarioController.text = snapshot.data["noinventario"];
              _descripcionController.text = snapshot.data["descripcion"];
              _departamentoController.text = snapshot.data["departamento"];
              _imagenController.text = snapshot.data["imagen"];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25.0,
                  ),
                  _textFieldNoInventario(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _textFielddescripcion(bloc),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _textFieldDepartamento(bloc),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _textFieldImagen(),
                  const SizedBox(
                    height: 75.0,
                  ),
                  _buttonEditInventary(widget.inventaryID),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buttonEditInventary(id) {
    return MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 110.0, vertical: 18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () async {
          await editInventary(
                  _noinventarioController.text,
                  _descripcionController.text,
                  _departamentoController.text,
                  _imagenController.text,
                  id)
              .then((_) => {
                    setState(() {}),
                    Navigator.pop(context),
                  });
        },
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Text(
          'Editar'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget _textFieldNoInventario() {
    return _TextFieldGeneral(
      'No. Inventario',
      'Ejemplo: 01',
      Icons.inventory_2_outlined,
      (value) {},
      TextInputType.text,
      false,
      null,
      _noinventarioController,
    );
  }

  Widget _textFielddescripcion(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return _TextFieldGeneral(
            'Descripción',
            'Ejemplo: Xbox Series X',
            Icons.description_outlined,
            bloc.changeEmail,
            TextInputType.text,
            false,
            snapshot.error,
            _descripcionController,
          );
        });
  }

  Widget _textFieldDepartamento(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return _TextFieldGeneral(
            'Departamento',
            'Ejemplo: Electrónica, Linea Blanca, etc.',
            Icons.text_snippet_outlined,
            bloc.changeEmail,
            null,
            false,
            snapshot.error,
            _departamentoController,
          );
        });
  }

  Widget _textFieldImagen() {
    return _TextFieldGeneral(
        'Imagen',
        'Ejemplo: https://th.bing.com/th/id/R.386d617de1476166435e8d020a10e981?rik=rJH%2fcl3S4kUmKQ&pid=ImgRaw&r=0',
        Icons.image,
        (value) {},
        TextInputType.text,
        false,
        null,
        _imagenController);
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
  final TextEditingController controller;
  const _TextFieldGeneral(
    this.labelText,
    this.hintText,
    this.icon,
    this.onChanged,
    this.keyboardType,
    this.obscureText,
    this.errorText,
    this.controller,
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
        controller: controller,
      ),
    );
  }
}

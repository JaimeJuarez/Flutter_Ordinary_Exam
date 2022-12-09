import 'package:flutter/material.dart';

void main() => runApp(const InventaryPage());

class InventaryPage extends StatefulWidget {
  const InventaryPage({Key key}) : super(key: key);

  @override
  State<InventaryPage> createState() => _InventaryPageState();
}

class _InventaryPageState extends State<InventaryPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Inventary Page'),
        // ),
        body: Center(
          child: Text('Inventary Page'),
        ),
      ),
    );
  }
}

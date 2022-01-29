// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CobaPage extends StatefulWidget {
  const CobaPage({Key? key}) : super(key: key);

  @override
  _CobaPageState createState() => _CobaPageState();
}

class _CobaPageState extends State<CobaPage> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          color: Colors.red[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              customRadio('coba', 1),
              customRadio('apa', 2),
              customRadio('naon', 3),
              customRadio('jika', 4),
            ],
          )),
    );
  }

  Widget customRadio(String text, int index) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: (selected == index) ? Colors.green : Colors.red),
        child: Text(text),
      ),
      onTap: () {
        setState(() {
          selected = index;
        });
      },
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CobaPage extends StatefulWidget {
  const CobaPage({Key? key}) : super(key: key);

  @override
  _CobaPageState createState() => _CobaPageState();
}

class _CobaPageState extends State<CobaPage> {
  final _namaController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        color: Colors.red[100],
        child: Form(
          child: Column(
            children: [
              TextFormField(
                obscureText: _isObscure,
                controller: _namaController,
                decoration: InputDecoration(
                    hintText: "masuk",
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_namaController.text.toString());
                  },
                  child: const Text("Print data"))
            ],
          ),
        ),
      ),
    );
  }
}

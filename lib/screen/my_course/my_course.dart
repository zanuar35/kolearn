import 'package:flutter/material.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text("Halaman Course"),
      ),
    );
  }
}
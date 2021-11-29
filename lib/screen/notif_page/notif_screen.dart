import 'package:flutter/material.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Text("Halaman notif"),
      ),
    );
  }
}

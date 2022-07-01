// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/core/app_images.dart';

class CobaPage extends StatefulWidget {
  const CobaPage({Key? key}) : super(key: key);

  @override
  _CobaPageState createState() => _CobaPageState();
}

class _CobaPageState extends State<CobaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.3,
          automaticallyImplyLeading: false,
          title: Text("About",
              style: TextStyle(color: Colors.black, fontSize: 22.sp)),
          centerTitle: true,
          leading: IconButton(
              onPressed: back,
              icon:
                  const Icon(Icons.chevron_left_rounded, color: Colors.black)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: AppImage.logo),
            const Text("V 1.0.1"),
            Text(
              "Dibuat untuk memenuhi tugas akhir 1",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xff666E7A),
              ),
            ),
          ],
        ));
  }

  void back() {
    Navigator.pop(context);
  }
}

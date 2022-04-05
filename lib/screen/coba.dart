// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(Icons.book_online_rounded, size: 80.w),
            ),
            SizedBox(
              height: 12.h,
            ),
            Center(
                child: Text(
              "Kolearn",
              style: TextStyle(
                  fontSize: 32.sp,
                  letterSpacing: 2.3,
                  color: Colors.blue,
                  fontWeight: FontWeight.w800),
            )),
            const Text("V 1.0.1"),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Deskripsi aplikasi bisa diisi nanti saja kalo sudah bisa",
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

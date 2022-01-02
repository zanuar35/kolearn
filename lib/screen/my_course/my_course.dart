import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCourse extends StatelessWidget {
  MyCourse({Key? key}) : super(key: key);

  List<Color> warnaCard = [
    Colors.white,
    const Color(0xff7383C0),
    const Color(0xffF9AE2B),
    const Color(0xff5BDEDE)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6F6FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Courses"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 22.h),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: categoryCard(warnaCard[index], index));
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryCard(Color warna, int indeks) {
    return Container(
      width: 138.w,
      height: 65.h,
      decoration: BoxDecoration(
        color: (indeks == 0) ? const Color(0xff53C0FA) : Colors.white,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 55.h,
            width: 55.h,
            decoration: BoxDecoration(shape: BoxShape.circle, color: warna),
          ),
          const Text("All Topics")
        ],
      ),
    );
  }
}

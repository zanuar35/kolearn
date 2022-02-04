import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({Key? key}) : super(key: key);

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  final List<Color> warnaCard = [
    Colors.white,
    const Color(0xff7383C0),
    const Color(0xffF9AE2B),
    const Color(0xff5BDEDE)
  ];

  final List<String> kategori = ['All', 'OnGoing', 'Finish'];

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7F6FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("My Course"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 22.h),
                child: SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: customRadio(kategori[index], index));
                      }),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const MateriCard();
                  }),
            )
          ],
        ),
      )),
    );
  }

  Widget categoryCard(Color warna, int indeks) {
    return Container(
      width: 108.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: (indeks == 0) ? const Color(0xff53C0FA) : Colors.white,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 45.h,
            width: 45.h,
            decoration: BoxDecoration(shape: BoxShape.circle, color: warna),
          ),
          Text(
            "All Topics",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget customRadio(String text, int index) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: (selected == index)
              ? const Color(0xff52C3FF)
              : const Color.fromARGB(255, 238, 122, 114),
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 55.h,
              width: 55.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 18.w,
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          selected = index;
        });
      },
    );
  }
}

class MateriCard extends StatelessWidget {
  const MateriCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w, bottom: 5.h),
      width: 360.w,
      height: 170.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          children: <Widget>[
            Container(
              height: 85.h,
              width: 85.h,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Huruf Vokal Dasar",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.book,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "12 Materi",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/course_detail/course_detail_screen.dart';

List<String> item = ['Pemula', 'Menengah', 'Mahir'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE7F6FF),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Hello, ",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff747474)),
                          ),
                          Text(
                            "Contoh Lee",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 35.r,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        "Category",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24.sp),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.only(right: 13),
                                  child: customRadio(item[index], index));
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        "Courses",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 24.h),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1.6 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: 10,
                          itemBuilder: (BuildContext ctx, index) {
                            return cardWidget();
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
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
              width: 15.w,
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

  Widget cardWidget() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Text(
                "ㅏ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 90.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 50.h,
              child: Center(
                child: Text(
                  "Basic Vowel",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFFD07D).withOpacity(0.58),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CourseDetail(),
          ),
        );
      },
    );
  }
}

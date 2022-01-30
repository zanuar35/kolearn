import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/materi_screen/materi_screen.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Detail'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: Container(
        color: const Color(0xffE6F6FF),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: <Widget>[
          courseCard(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 27.w, right: 27.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      offset: Offset(-2, -2),
                      blurRadius: 5)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Basic Vowel',
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(
                        color: Color(0xff9F98AD), fontWeight: FontWeight.w600),
                  ),
                  rowButton(),
                  rowButton(),
                  button()
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget courseCard() {
    return Padding(
      padding:
          EdgeInsets.only(left: 27.w, right: 27.w, top: 40.h, bottom: 100.h),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                offset: Offset(0, 4),
                blurRadius: 4)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 34.w, right: 60.w),
          child: Row(
            children: <Widget>[
              Container(
                width: 68.w,
                height: 68.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.yellow[700]),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Huruf vocal dasar",
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.library_books_rounded),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Text("12 materi"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Row(
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 60.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xff7383BF)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MateriScreen(),
                  ),
                );
              },
              child: const Text("Submit"),
            ),
          ),
        ),
      ],
    );
  }

  Widget rowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 70.h,
          width: 70.h,
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        const Text("Materi"),
        Expanded(child: Container()),
        Container(
          width: 35.w,
          height: 35.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.29),
                  offset: Offset(0, 2),
                  blurRadius: 8)
            ],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.lock_outline_rounded),
        )
      ],
    );
  }
}

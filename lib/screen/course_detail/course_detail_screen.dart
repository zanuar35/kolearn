// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolearn/screen/course_detail/widget/row_btn.dart';
import 'package:kolearn/screen/course_detail/widget/submit_btn.dart';
import 'package:kolearn/screen/home/home_screen.dart';

import 'widget/course_card.dart';

class CourseDetail extends StatefulWidget {
  CourseDetail({required this.index, required this.course, Key? key})
      : super(key: key);

  List course = [];
  int index;
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
          CourseCard(
            title: course[widget.index].courseName,
            hangul: course[widget.index].title,
          ),
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
                    course[widget.index].courseName.toUpperCase(),
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(
                        color: Color(0xff9F98AD), fontWeight: FontWeight.w600),
                  ),
                  RowBtn(
                    text: "Materi",
                    child: SvgPicture.asset(
                      'assets/edit.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  RowBtn(
                    text: "Latihan Soal",
                    child: SvgPicture.asset(
                      'assets/book-alt.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SubmitBtn(id: course[widget.index].id),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

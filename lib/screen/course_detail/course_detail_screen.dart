// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/course_detail/cubit/course_detail_cubit.dart';
import 'package:kolearn/screen/course_detail/widget/row_btn.dart';
import 'package:kolearn/screen/course_detail/widget/submit_btn.dart';
import 'package:kolearn/screen/home/home_screen.dart';
import 'package:shimmer/shimmer.dart';

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
  void initState() {
    super.initState();
    BlocProvider.of<CourseDetailCubit>(context).getDetail(widget.index + 1);
  }

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
          BlocBuilder<CourseDetailCubit, CourseDetailState>(
            builder: (context, state) {
              if (state is CourseDetailLoading) {
                return Shimmer.fromColors(
                    baseColor: Color(0xffC2C2C2),
                    highlightColor: Color.fromARGB(255, 175, 170, 170),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 27.w, right: 27.w, top: 40.h, bottom: 100.h),
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
                      ),
                    ));
              }
              return Container();
            },
          ),
          BlocBuilder<CourseDetailCubit, CourseDetailState>(
            builder: (context, state) {
              if (state is CourseDetailSuccess) {
                EasyLoading.dismiss();
                return CourseCard(
                  title: state.courseDetail.data.courseName,
                  hangul: state.courseDetail.data.title,
                  index: widget.index + 1,
                );
              }
              return Container();
            },
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
                  BlocBuilder<CourseDetailCubit, CourseDetailState>(
                    builder: (context, state) {
                      if (state is CourseDetailLoading) {
                        return Shimmer.fromColors(
                            baseColor: Color(0xffC2C2C2),
                            highlightColor: Color.fromARGB(255, 175, 170, 170),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 2.w,
                                  right: 2.w,
                                  top: 4.h,
                                  bottom: 10.h),
                              child: Container(
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.r),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                        offset: Offset(0, 4),
                                        blurRadius: 4)
                                  ],
                                ),
                              ),
                            ));
                      }
                      if (state is CourseDetailSuccess) {
                        return Text(
                          state.courseDetail.data.courseName.toUpperCase(),
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        );
                      }
                      return Container();
                    },
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(
                        color: Color(0xff9F98AD), fontWeight: FontWeight.w600),
                  ),
                  RowBtn(
                      isSubmited: course[widget.index].isSubmited,
                      text: "Materi",
                      child: Icon(
                        Icons.description_outlined,
                        size: 34.w,
                        color: Color(0xff3F3F3F),
                      )),
                  RowBtn(
                      isSubmited: course[widget.index].isSubmited,
                      text: "Latihan Soal",
                      child: Icon(
                        Icons.edit_note_rounded,
                        size: 34.w,
                        color: Color(0xff3F3F3F),
                      )),
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

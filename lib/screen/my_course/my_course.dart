import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/my_course/cubit/mycourse_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/core.dart';
import '../course_detail/course_detail_screen.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({Key? key}) : super(key: key);

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MycourseCubit>(context).getCourse();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int selected = 0;
  int? selectedIndex;

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
              children: [
                Container(
                  height: 70.h,
                  color: const Color(0xffE7F6FF),
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 10.w),
                      categoryBtn(
                          0, AppImage.progressAllBlue, AppImage.progressAll),
                      SizedBox(width: 20.w),
                      categoryBtn(1, AppImage.onGoingBlue, AppImage.onGoing),
                      SizedBox(width: 20.w),
                      categoryBtn(2, AppImage.finishBlue, AppImage.finish),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ),
                BlocBuilder<MycourseCubit, MycourseState>(
                  builder: (context, state) {
                    if (state is MycourseLoading) {
                      return Shimmer.fromColors(
                          baseColor: AppColors.baseColor,
                          highlightColor: AppColors.highlightColor,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return courseCard(
                                  "a",
                                  "a",
                                  1,
                                  context,
                                );
                              }));
                    }
                    if (state is MycourseSuccess) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 2.h),
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.getCourseModel.length,
                          itemBuilder: (context, index) {
                            return courseCard(
                              state.getCourseModel[index].courseName,
                              state.getCourseModel[index].title,
                              state.getCourseModel[index].courseId - 1,
                              context,
                            );
                          },
                        ),
                      );
                    }
                    if (state is MycourseLoaded) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 2.h),
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.getCourseModel.length,
                          itemBuilder: (context, index) {
                            return courseCard(
                              state.getCourseModel[index].courseName,
                              state.getCourseModel[index].title,
                              state.getCourseModel[index].courseId - 1,
                              context,
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget categoryBtn(int index, Image gambar, Image gambar1) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
          selectedIndex = index;
          switch (index) {
            case 0:
              {
                BlocProvider.of<MycourseCubit>(context)
                    .getCourseStatus('started');
              }
              break;

            case 1:
              {
                BlocProvider.of<MycourseCubit>(context)
                    .getCourseStatus('started');
              }
              break;

            case 2:
              {
                BlocProvider.of<MycourseCubit>(context)
                    .getCourseStatus('progress');
              }
              break;
            default:
              {
                // ignore: avoid_print
                print("Invalid choice");
              }
              break;
          }
        });
      },
      child: Container(
        width: 120.w,
        height: 70.h,
        color: Colors.transparent,
        child: selected == index ? gambar : gambar1,
      ),
    );
  }
}

Widget courseCard(String courseName, title, int index, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => CourseDetail(
            index: index,
          ),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 200),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w, bottom: 5.h),
      width: 360.w,
      height: 130.h,
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
              height: 75.h,
              width: 75.h,
              decoration: BoxDecoration(
                color: const Color(0xff1D207B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40.sp,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
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
                  courseName,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
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
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/my_course/cubit/mycourse_cubit.dart';
import 'package:kolearn/core/app_colors.dart';
import 'package:kolearn/screen/home/widget/category_widget.dart';
import 'package:shimmer/shimmer.dart';

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
              children: [
                Container(
                  color: const Color(0xffE7F6FF),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LevelButtonWidget(
                        label: "Easy",
                      ),
                      LevelButtonWidget(
                        label: "Medium",
                      ),
                      LevelButtonWidget(
                        label: "Hard",
                      ),
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
                    return Container();
                  },
                )
              ],
            ),
          ),
        ));
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

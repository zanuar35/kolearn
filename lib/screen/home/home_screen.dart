// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/course/cubit/course_cubit.dart';
import 'package:kolearn/screen/home/widget/category_widget.dart';
import 'package:kolearn/screen/home/widget/container_profile.dart';
import 'package:kolearn/screen/home/widget/materi_card_widget.dart';
import 'package:shimmer/shimmer.dart';

List<String> item = ['Pemula', 'Menengah', 'Mahir'];
List course = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  @override
  void initState() {
    super.initState();
    if (course.isEmpty) {
      BlocProvider.of<CourseCubit>(context).fetchCourse();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE7F6FF),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ContainerProfile(),
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
                    const CustomRadio(),
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
                    BlocBuilder<CourseCubit, CourseState>(
                      builder: (context, state) {
                        if (state is CourseLoading) {
                          return SizedBox(
                            width: 200.0,
                            height: 100.0,
                            child: Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.blueGrey,
                                child: Container(
                                  height: 120.h,
                                  width: 40.w,
                                  color: Colors.black,
                                )),
                          );
                        }
                        if (state is CourseSuccess) {
                          return Container(
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
                                itemCount: state.courses.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return MateriCard(
                                    index: index,
                                    text: state.courses[index].title,
                                    courseName: state.courses[index].courseName,
                                  );
                                }),
                          );
                        }
                        return Container();
                      },
                    ),
                    BlocConsumer<CourseCubit, CourseState>(
                      listener: (context, state) {
                        if (state is CourseSuccess) {
                          if (course.isEmpty) {
                            setState(() {
                              course = state.courses;
                            });
                          }
                        }
                      },
                      builder: (context, state) {
                        return Container();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}

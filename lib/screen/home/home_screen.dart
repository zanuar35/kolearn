// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/course/cubit/course_cubit.dart';

import 'package:kolearn/screen/home/widget/container_profile.dart';
import 'package:kolearn/screen/home/widget/materi_card_widget.dart';
import 'package:shimmer/shimmer.dart';

List course = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  int selectedIndex = -1;
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
                      height: 16.h,
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
                      height: 16.h,
                    ),
                    Container(
                      height: 70.h,
                      color: const Color(0xffE7F6FF),
                      width: double.infinity,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          categoryBtn(
                            0,
                            Image.asset('assets/img/all_btnBlue.png'),
                            Image.asset('assets/img/all_btn.png'),
                          ),
                          categoryBtn(
                            1,
                            Image.asset('assets/img/easy_btnBlue.png'),
                            Image.asset('assets/img/easy_btn.png'),
                          ),
                          categoryBtn(
                            2,
                            Image.asset('assets/img/medium_btnBlue.png'),
                            Image.asset('assets/img/medium_btn.png'),
                          ),
                          categoryBtn(
                            3,
                            Image.asset('assets/img/advance_btnBlue.png'),
                            Image.asset('assets/img/advance_btn.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
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
                                horizontal: 30.w, vertical: 20.h),
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
                                      courseName:
                                          state.courses[index].courseName,
                                      courses: course);
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
        ),
      ),
    );
  }

  Widget categoryBtn(int index, Image gambar, Image gambar1) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
          width: 120.w,
          height: 70.h,
          color: Colors.transparent,
          child: selected == index ? gambar : gambar1),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/course/cubit/course_cubit.dart';
import 'package:kolearn/core/app_colors.dart';

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
  int? selectedIndex;
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
                          return Container(
                            padding: EdgeInsets.only(
                                top: 20.h,
                                left: 35.w,
                                right: 35.w,
                                bottom: 30.h),
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 1.6 / 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount: 4,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Shimmer.fromColors(
                                      baseColor: AppColors.baseColor,
                                      highlightColor: AppColors.highlightColor,
                                      child: Container(
                                        height: 120.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ));
                                }),
                          );
                        }
                        if (state is CourseBerhasil) {
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
                                itemCount: course.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return MateriCard(
                                      index: course[index].id - 1,
                                      text: course[index].title,
                                      courseName: course[index].courseName,
                                      courses: course);
                                }),
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
                                      index: state.courses[index].id - 1,
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
                        if (state is CourseBerhasil) {
                          setState(() {
                            course.clear();
                            course = state.course;
                          });
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
          selectedIndex = index;
          switch (index) {
            case 0:
              {
                BlocProvider.of<CourseCubit>(context).fetchCourse();
              }
              break;

            case 1:
              {
                BlocProvider.of<CourseCubit>(context).getCourseCategory(1);
              }
              break;

            case 2:
              {
                BlocProvider.of<CourseCubit>(context).getCourseCategory(2);
              }
              break;

            case 3:
              {
                BlocProvider.of<CourseCubit>(context).getCourseCategory(3);
              }
              break;
            default:
              {
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
